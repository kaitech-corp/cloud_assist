import {firestore} from "firebase-admin";
import {onDocumentCreated} from "firebase-functions/firestore";
import {HttpsError, onCall} from "firebase-functions/v2/https";
import {db} from "../core/config";
import {
  analyzeReportedServiceContent,
  ReportAnalysis,
} from "../services/ai_service";
import {
  canonicalServiceField,
  normalizeListContent,
  normalizeTextContent,
  removeCloudAndWhitespace,
} from "../services/utils";

const MIN_REPORT_INTERVAL_MS = 60 * 1000;
const MAX_REPORTS_PER_HOUR = 5;

const ALLOWED_REPORT_TYPES = new Set([
  "ReportType.outdated",
  "ReportType.inaccurate",
  "ReportType.incomplete",
  "ReportType.irrelevant",
  "ReportType.inappropriate",
  "outdated",
  "inaccurate",
  "incomplete",
  "irrelevant",
  "inappropriate",
]);

/**
 * Normalizes strings for reported-content matching.
 * @param {unknown} value - Value to compare.
 * @return {string} Comparable text.
 */
function comparable(value: unknown): string {
  return String(value || "").replace(/\s+/g, " ").trim();
}

/**
 * Checks whether the reported content still exists in the current field value.
 * @param {string | string[]} currentValue - Current service field value.
 * @param {string} reportedContent - Reported content from the user.
 * @return {boolean} True when the report is still anchored to current content.
 */
function reportMatchesCurrentContent(
  currentValue: string | string[],
  reportedContent: string,
): boolean {
  const reported = comparable(reportedContent);
  if (Array.isArray(currentValue)) {
    return currentValue.some((item) => comparable(item) === reported);
  }
  return comparable(currentValue) === reported;
}

/**
 * Returns a clean replacement value for the field, or null when invalid.
 * @param {string} field - Canonical service field.
 * @param {unknown} replacementText - Proposed text value.
 * @param {unknown} replacementList - Proposed list value.
 * @return {string | string[] | null} Normalized replacement.
 */
function buildReplacement(
  field: string,
  replacementText: unknown,
  replacementList: unknown,
): string | string[] | null {
  if (["benefits", "cons", "useCases"].includes(field)) {
    if (!Array.isArray(replacementList)) return null;
    const normalized = normalizeListContent(
      replacementList.map((item) => String(item)),
    );
    return normalized.length > 0 ? normalized : null;
  }

  if (typeof replacementText !== "string") return null;
  const normalized = normalizeTextContent(replacementText);
  return normalized.length > 0 ? normalized : null;
}

/**
 * Creates a content report after enforcing per-user cooldowns.
 */
export const submitContentReport = onCall(async (request) => {
  const uid = request.auth?.uid;
  if (!uid) {
    throw new HttpsError("permission-denied", "User is not authenticated.");
  }

  const content = String(request.data.content || "").trim();
  const reportType = String(request.data.reportType || "").trim();
  const contentDocID = String(request.data.contentDocID || "").trim();
  const contentField = canonicalServiceField(request.data.contentField);

  if (!content || !contentDocID || !contentField ||
      !ALLOWED_REPORT_TYPES.has(reportType)) {
    throw new HttpsError("invalid-argument", "Invalid report payload.");
  }

  const nowMillis = Date.now();
  const rateRef = db.collection("reportRateLimits").doc(uid);
  const reportRef = db.collection("reportedContent").doc();
  const serviceDocID = removeCloudAndWhitespace(contentDocID);

  await db.runTransaction(async (transaction) => {
    const rateSnapshot = await transaction.get(rateRef);
    const existing = rateSnapshot.exists ? rateSnapshot.data() || {} : {};
    const timestamps = Array.isArray(existing.timestamps) ?
      existing.timestamps as number[] : [];
    const recent = timestamps.filter((value) =>
      typeof value === "number" && nowMillis - value < 60 * 60 * 1000,
    );
    const lastReportAt = recent.length > 0 ? recent[recent.length - 1] : 0;

    if (nowMillis - lastReportAt < MIN_REPORT_INTERVAL_MS) {
      throw new HttpsError(
        "resource-exhausted",
        "Please wait before submitting another report.",
      );
    }
    if (recent.length >= MAX_REPORTS_PER_HOUR) {
      throw new HttpsError(
        "resource-exhausted",
        "You have reached the hourly report limit.",
      );
    }

    transaction.set(rateRef, {
      timestamps: [...recent, nowMillis],
      lastReportAt: firestore.FieldValue.serverTimestamp(),
    }, {merge: true});

    transaction.set(reportRef, {
      content,
      contentType: reportType,
      contentDocID: serviceDocID,
      contentField,
      docID: reportRef.id,
      timestamp: firestore.FieldValue.serverTimestamp(),
      uid,
      status: "pending",
    });
  });

  return {docID: reportRef.id, status: "pending"};
});

/**
 * Reviews newly submitted reports and updates service content only when the
 * report can be verified and the proposed replacement is display-safe.
 */
export const analyzeContentReport = onDocumentCreated(
  "reportedContent/{reportId}",
  async (event) => {
    const snapshot = event.data;
    if (!snapshot) return;

    const reportId = event.params.reportId;
    const report = snapshot.data();
    const field = canonicalServiceField(report.contentField);
    const content = String(report.content || "");
    const serviceDocID = String(report.contentDocID || "");

    if (!field || !content || !serviceDocID) {
      await snapshot.ref.update({
        status: "rejected",
        analysisReason: "The report was missing required service context.",
        analyzedAt: firestore.FieldValue.serverTimestamp(),
      });
      return;
    }

    const serviceRef = db.collection("services").doc(serviceDocID);
    const serviceSnapshot = await serviceRef.get();
    if (!serviceSnapshot.exists) {
      await snapshot.ref.update({
        status: "rejected",
        analysisReason: "The reported service document was not found.",
        analyzedAt: firestore.FieldValue.serverTimestamp(),
      });
      return;
    }

    const serviceData = serviceSnapshot.data() || {};
    const currentValue = serviceData[field];
    if (typeof currentValue !== "string" && !Array.isArray(currentValue)) {
      await snapshot.ref.update({
        status: "rejected",
        analysisReason: "The reported field is not a supported content field.",
        analyzedAt: firestore.FieldValue.serverTimestamp(),
      });
      return;
    }

    if (!reportMatchesCurrentContent(currentValue, content)) {
      await snapshot.ref.update({
        status: "stale",
        analysisReason: "The reported content no longer matches the service.",
        analyzedAt: firestore.FieldValue.serverTimestamp(),
      });
      return;
    }

    let analysis: ReportAnalysis;
    try {
      analysis = await analyzeReportedServiceContent({
        service: String(serviceData.service || serviceDocID),
        provider: String(serviceData.provider || "cloud"),
        field,
        reportType: String(report.contentType || ""),
        currentValue,
      });
    } catch (error: unknown) {
      await snapshot.ref.update({
        status: "no_update",
        analysisReason: "The report could not be verified.",
        analysisError: error instanceof Error ? error.message : String(error),
        analyzedAt: firestore.FieldValue.serverTimestamp(),
      });
      return;
    }

    const canUpdate = analysis.shouldUpdate &&
      analysis.verified &&
      analysis.reasoningMatches;
    const replacement = canUpdate ? buildReplacement(
      field,
      analysis.replacementText,
      analysis.replacementList,
    ) : null;

    if (!canUpdate || replacement === null) {
      await snapshot.ref.update({
        status: "no_update",
        analysisReason: analysis.reason,
        analysis,
        analyzedAt: firestore.FieldValue.serverTimestamp(),
      });
      return;
    }

    await serviceRef.update({
      [field]: replacement,
      lastUpdated: firestore.FieldValue.serverTimestamp(),
      lastContentReportID: reportId,
    });

    await snapshot.ref.update({
      status: "updated",
      analysisReason: analysis.reason,
      analysis,
      appliedField: field,
      appliedAt: firestore.FieldValue.serverTimestamp(),
      analyzedAt: firestore.FieldValue.serverTimestamp(),
    });
  },
);
