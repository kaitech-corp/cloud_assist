import {firestore} from "firebase-admin";
import {onDocumentCreated} from "firebase-functions/firestore";
import {HttpsError, onCall} from "firebase-functions/v2/https";
import {db} from "../core/config";

/**
 * Validates that all service documents have the required fields.
 */
export const checkServices = onCall(async (request) => {
  if (!request.auth?.uid) {
    throw new HttpsError("permission-denied", "User is not authenticated.");
  }

  try {
    const servicesSnap = await db.collection("services").get();
    servicesSnap.forEach((doc) => {
      const serviceData = doc.data();
      const missingFields = [];

      const required = [
        "service", "description", "detail", "link", "provider",
        "type", "benefits", "cons", "useCases", "example",
      ];

      required.forEach((field) => {
        if (!serviceData[field]) missingFields.push(field);
      });

      if (missingFields.length > 0) {
        console.error(`Document ${doc.id} missing fields: ` +
          `${missingFields.join(", ")}`);
      }
    });
  } catch (error) {
    console.log("🚀 ~ file: maintenance.ts: checkServices ~ error:", error);
  }
});

/**
 * Creates a document in 'popularServices' for every new service document.
 */
export const createPopularServicesDocument = onDocumentCreated(
  "services/{serviceId}",
  async (event) => {
    const serviceId = event.params.serviceId;
    try {
      await db.collection("popularServices").doc(serviceId).set({
        popularity: 0,
        lastUpdated: firestore.FieldValue.serverTimestamp(),
        docID: serviceId,
      });
      console.log(`Created popular service document for: ${serviceId}`);
    } catch (error) {
      console.error(`Error creating popular service document: ${error}`);
    }
  },
);
