import {initializeApp} from "firebase-admin/app";
import {firestore} from "firebase-admin";

initializeApp();
export const db = firestore();
