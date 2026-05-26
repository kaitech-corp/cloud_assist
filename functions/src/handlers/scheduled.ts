import {firestore} from "firebase-admin";
import {onSchedule} from "firebase-functions/v2/scheduler";
import {db} from "../core/config";
import {removeCloudAndWhitespace} from "../services/utils";
import {
  discoverCloudServices,
  generateServiceDataVertex,
} from "../services/ai_service";
import {saveServiceDataToFirestore} from "../services/firestore_service";

const STALE_DAYS = 30;
const CLOUD_PROVIDERS = ["GCP", "AWS", "Azure"];

/**
 * Weekly: regenerates AI content for any service document that has not
 * been updated in 30+ days, or that has an empty description (newly
 * discovered services awaiting their first full generation).
 */
export const refreshStaleServices = onSchedule({
  schedule: "0 2 * * 0", // Sundays at 02:00 UTC
  timeoutSeconds: 540,
  memory: "512MiB",
}, async () => {
  const threshold = new Date(
    Date.now() - STALE_DAYS * 24 * 60 * 60 * 1000,
  );
  const snap = await db.collection("services").get();

  for (const doc of snap.docs) {
    const data = doc.data();
    if (data.deprecated) continue;

    const lastUpdated = data.lastUpdated?.toDate?.();
    const isStale = !lastUpdated || lastUpdated < threshold;
    const isEmpty = !data.description;
    if (!isStale && !isEmpty) continue;

    const {service, type} = data;
    if (!service || !type) continue;

    try {
      const parsed = await generateServiceDataVertex(service, type);
      const provider = data.provider || "google";
      await saveServiceDataToFirestore(parsed, service, provider);
      console.log(`Refreshed: ${service}`);
    } catch (error) {
      console.error(`Failed to refresh ${service}:`, error);
    }
  }
});

/**
 * Monthly: uses Vertex AI with Google Search grounding to discover the
 * current service catalog for each cloud provider. Creates stub documents
 * for new services (triggering createFacts automatically) and flags
 * services that no longer appear in the catalog as deprecated.
 */
export const discoverAndSyncServices = onSchedule({
  schedule: "0 3 1 * *", // 1st of each month at 03:00 UTC
  timeoutSeconds: 300,
  memory: "512MiB",
}, async () => {
  // Build a lookup of all existing document IDs once to avoid
  // false-positive duplication across providers.
  const allSnap = await db.collection("services").get();
  const existingDocIds = new Set(allSnap.docs.map((d) => d.id));

  for (const cloudProvider of CLOUD_PROVIDERS) {
    const discovered = await discoverCloudServices(cloudProvider);
    if (discovered.length === 0) {
      console.warn(`No services discovered for ${cloudProvider}; skipping.`);
      continue;
    }

    // --- Create stubs for newly discovered services ---
    for (const item of discovered) {
      const docId = removeCloudAndWhitespace(item.service);
      if (existingDocIds.has(docId)) continue;

      await db.collection("services").doc(docId).set({
        service: item.service,
        type: item.type,
        cloudProvider: cloudProvider,
        provider: cloudProvider === "GCP" ? "google" : "openai",
        description: "",
        detail: "",
        benefits: [],
        cons: [],
        useCases: [],
        link: "",
        example: "",
        deprecated: false,
        lastUpdated: firestore.FieldValue.serverTimestamp(),
      });
      existingDocIds.add(docId);
      console.log(`New service: ${item.service} (${cloudProvider})`);
    }

    // --- Flag deprecated services within this provider ---
    // Only considers documents that carry a cloudProvider field so that
    // services created before this field existed are not touched.
    const discoveredNames = new Set(
      discovered.map((d) => d.service.toLowerCase().trim()),
    );
    const providerSnap = await db.collection("services")
      .where("cloudProvider", "==", cloudProvider)
      .get();

    for (const doc of providerSnap.docs) {
      const name = doc.data().service?.toLowerCase().trim();
      if (discoveredNames.has(name) || doc.data().deprecated) continue;

      await doc.ref.update({
        deprecated: true,
        deprecatedAt: firestore.FieldValue.serverTimestamp(),
      });
      console.log(`Deprecated: ${name} (${cloudProvider})`);
    }
  }
});
