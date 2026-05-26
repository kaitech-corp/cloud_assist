/* eslint-disable @typescript-eslint/no-explicit-any */
import {firestore} from "firebase-admin";
import * as functions from "firebase-functions/v1";
import {onDocumentCreated} from "firebase-functions/firestore";
import {HttpsError, onCall} from "firebase-functions/v2/https";
import {db} from "../core/config";
import {getSecretsClient} from "../core/secrets";

/**
 * Creates a user document in Firestore when a new user is created in
 * Firebase Auth.
 */
export const createUserDocument = functions.auth.user().onCreate(
  async (user) => {
    const {uid, displayName, email, photoURL} = user;

    try {
      await db.collection("users").doc(uid).set({
        displayName: displayName || "",
        email: email || "",
        photoURL: photoURL || "",
        uid: uid,
        dateCreated: firestore.FieldValue.serverTimestamp(),
        paid: true,
      });
      await db.collection("userInteraction").doc(uid).set({docID: uid});
      console.log(`User document created for user with UID: ${uid}`);
    } catch (error) {
      console.error(`Error creating user document for user with UID: ${uid}`,
        error);
    }
  });

/**
 * Checks if the current user's UID matches the admin UID stored in secrets.
 */
export const checkUserId = onCall(async (request) => {
  try {
    const authenticatedUid = request.auth?.uid;
    const adminUID = await getSecretsClient("adminUID");

    if (authenticatedUid === adminUID) {
      return true;
    } else {
      throw new HttpsError("permission-denied", "User ID does not match.");
    }
  } catch (error: any) {
    console.log("🚀 ~ file: users.ts: checkUserId ~ error:", error);
    throw new HttpsError("internal", error.message, error);
  }
});

/**
 * Updates the lastInteraction timestamp for a user when they interact
 * with the app.
 */
export const lastInteractionTimestamp = onDocumentCreated(
  "userInteraction/{uid}/interactions/{doc}",
  async (event) => {
    const uid = event.params.uid;
    try {
      await db.collection("userInteraction").doc(uid).update({
        lastUpdated: firestore.FieldValue.serverTimestamp(),
      });
      console.log("Updated user interaction document");
    } catch (error) {
      console.error(`Error updating user interaction document: ${error}`);
    }
  },
);
