/* eslint-disable @typescript-eslint/no-explicit-any */
import {firestore} from "firebase-admin";
import {db} from "../core/config";
import {removeCloudAndWhitespace, removeLeadingNumbers} from "./utils";

/**
 * Saves the response from ChatGPT to Firestore.
 *
 * @param {string} service The service name in String format.
 * @param {string} result The response from ChatGPT in String format.
 * @return {Promise<void>} A promise that resolved when the response is saved.
 */
export async function savePlainResponse(service: string, result: string) {
  try {
    await db.collection("chatGPT").doc().set({
      service: service,
      response: result,
      timestamp: firestore.FieldValue.serverTimestamp(),
    });
  } catch (error) {
    console.log("🚀 ~ file: firestore_service.ts: savePlainResponse ~ error:",
      error);
  }
}

/**
 * Saves the response from ChatGPT to Firestore.
 *
 * @param {any[]} response The response from ChatGPT in JSON format (array).
 * @param {string} service The name of the GCP service.
 * @return {Promise<void>} A promise that resolved when the response is saved.
 */
export async function saveChatGPTResponse(response: any[], service: string) {
  const docName = removeCloudAndWhitespace(service);

  try {
    response.forEach((item) => {
      const docID = db.collection("services").doc().id;
      db.collection("services")
        .doc(docName)
        .collection("facts")
        .doc(docID)
        .set({
          fact: item.fun_fact,
          timestamp: firestore.FieldValue.serverTimestamp(),
        });
    });
  } catch (error) {
    console.log("🚀 ~ file: firestore_service.ts: " +
      "saveChatGPTResponse ~ error:", error);
  }
}

/**
 * Saves the fact from ChatGPT to Firestore.
 *
 * @param {string} fact The response from ChatGPT.
 * @param {string} service The name of the GCP service.
 * @return {Promise<void>} A promise that resolved when the response is saved.
 */
export async function saveServiceFact(fact: string, service: string) {
  const docName = removeCloudAndWhitespace(service);

  try {
    const docID = db.collection("services").doc().id;
    await db.collection("services").doc(docName).collection("facts").doc(docID)
      .set({
        fact: fact,
        timestamp: firestore.FieldValue.serverTimestamp(),
        flag: null,
        docID: docID,
      });

    const docID2 = db.collection("quickFacts").doc().id;
    await db.collection("quickFacts").doc(docID2).set({
      fact: fact,
      timestamp: firestore.FieldValue.serverTimestamp(),
      flag: null,
      docID: docID,
      service: service,
    });
  } catch (error) {
    console.log("🚀 ~ file: firestore_service.ts: " +
      "saveServiceFact ~ error:", error);
  }
}

/**
 * Saves a report to Firestore database.
 * @async
 * @function saveReportToFirestore
 * @param {string} reportResponse - The report data to be saved.
 * @param {string} title - The title of the report.
 * @return {Promise<void>}
 */
export async function saveReportToFirestore(
  reportResponse: string,
  title: string,
) {
  try {
    const ref = await db.collection("reports").add({
      content: reportResponse,
      timestamp: firestore.FieldValue.serverTimestamp(),
      title: title,
    });
    await ref.update({
      docID: ref.id,
    });
  } catch (error) {
    console.log("🚀 ~ file: firestore_service.ts: " +
      "saveReportToFirestore ~ error:", error);
  }
}

/**
 * Saves a Service to Firestore database.
 * @async
 * @function saveServiceDataToFirestore
 * @param {any} response - The response data as JSON string.
 * @param {string} service - The service name.
 * @param {string} provider - The service provider.
 * @return {Promise<void>}
 */
export async function saveServiceDataToFirestore(
  response: any,
  service: string,
  provider: string,
) {
  try {
    const serviceData = typeof response === "string" ?
      JSON.parse(response) : response;
    const serviceName = removeCloudAndWhitespace(serviceData.service ||
      service);
    await db.collection("services").doc(serviceName).set({
      benefits: serviceData.benefits,
      cons: serviceData.cons,
      description: serviceData.description,
      detail: serviceData.detail,
      example: serviceData.example,
      link: serviceData.link,
      provider: provider,
      service: serviceData.service,
      type: serviceData.type,
      useCases: serviceData.useCases,
      lastUpdated: firestore.FieldValue.serverTimestamp(),
    });
  } catch (error) {
    console.error("🚨 ~ file: firestore_service.ts: " +
      "saveServiceDataToFirestore:", error);
  }
}

/**
 * Maps a parsed service data object to the Firestore update payload.
 * @param {any} serviceData - Parsed JSON from the AI response.
 * @param {string} field - The field name to update.
 * @return {any} The partial update object.
 */
function buildFieldUpdate(serviceData: any, field: string): any {
  switch (field) {
  case "description": return {description: serviceData.description};
  case "detail": return {detail: serviceData.detail};
  case "benefits": return {benefits: serviceData.benefits};
  case "cons": return {cons: serviceData.cons};
  case "useCases":
    return {useCases: removeLeadingNumbers(serviceData.useCases)};
  default: return {};
  }
}

/**
 * Update firestore document fields.
 * @async
 * @function updateFirestoreDocumentField
 * @param {string} response - The response data (JSON string).
 * @param {string} docID - The document ID.
 * @param {string} field - The document field to be updated.
 * @return {Promise<void>}
 */
export async function updateFirestoreDocumentField(
  response: string,
  docID: string,
  field: string,
) {
  try {
    const serviceData = JSON.parse(response);
    const updateData = {
      ...buildFieldUpdate(serviceData, field),
      lastUpdated: firestore.FieldValue.serverTimestamp(),
    };
    await db.collection("services").doc(docID).update(updateData);
  } catch (error) {
    console.error("🚨 ~ firestore_service.ts: " +
      "updateFirestoreDocumentField:", error);
    await db.collection("failedToSave").doc().set({
      data: response.toString(),
      timestamp: firestore.FieldValue.serverTimestamp(),
    });
  }
}
