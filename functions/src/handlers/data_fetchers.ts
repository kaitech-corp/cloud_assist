/* eslint-disable @typescript-eslint/no-explicit-any */
import {HttpsError, onCall} from "firebase-functions/v2/https";
import axios from "axios";
import {discoverCloudServices} from "../services/ai_service";

/**
 * Common helper for fetching JSON data from Google Cloud Storage.
 * @param {string} url The URL to fetch from.
 */
async function fetchFromStorage(url: string) {
  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      return JSON.stringify(response.data);
    } else {
      throw new HttpsError("internal",
        `Storage returned status ${response.status}`);
    }
  } catch (error: any) {
    console.error(`Error fetching from ${url}:`, error);
    throw new HttpsError("internal",
      error.message || "Error fetching data from storage");
  }
}

export const getCombinedData = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Unable to perform action.");
  }
  return fetchFromStorage("https://storage.googleapis.com/" +
    "api-project-371618.appspot.com/combined_data.json");
});

export const getCloudData = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Unable to perform action.");
  }
  return fetchFromStorage("https://storage.googleapis.com/" +
    "api-project-371618.appspot.com/cloud_data.json");
});

export const getNetworkingData = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Unable to perform action.");
  }
  return fetchFromStorage("https://storage.googleapis.com/" +
    "api-project-371618.appspot.com/cloud_networking.json");
});

export const getDatabaseData = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Unable to perform action.");
  }
  return fetchFromStorage("https://storage.googleapis.com/" +
    "api-project-371618.appspot.com/database_data.json");
});

export const getSecurityData = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Unable to perform action.");
  }
  return fetchFromStorage("https://storage.googleapis.com/" +
    "api-project-371618.appspot.com/security_data.json");
});

export const getGCloudData = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Unable to perform action.");
  }
  return fetchFromStorage("https://storage.googleapis.com/" +
    "api-project-371618.appspot.com/cmd_line_cheat_sheet.json");
});

export const getDatabaseComparisonQuestions = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Unable to perform action.");
  }
  return fetchFromStorage("https://storage.googleapis.com/" +
    "api-project-371618.appspot.com/database_comparison_questions.json");
});

export const getFactsData = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Unable to perform action.");
  }
  return fetchFromStorage("https://storage.googleapis.com/" +
    "api-project-371618.appspot.com/facts.json");
});

/**
 * Returns the Azure service catalog grouped by type, using Vertex AI
 * with Google Search grounding for up-to-date results.
 */
export const getAzureServiceList = onCall(async (request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Unable to perform action.");
  }

  const discovered = await discoverCloudServices("Azure");
  if (discovered.length === 0) {
    throw new HttpsError("unavailable",
      "Could not retrieve Azure service list.");
  }

  // Group flat service list by type to match ServiceModel structure
  const grouped = new Map<string, string[]>();
  for (const item of discovered) {
    if (!grouped.has(item.type)) grouped.set(item.type, []);
    grouped.get(item.type)!.push(item.service);
  }

  const result = Array.from(grouped.entries()).map(([type, services]) => ({
    category: type,
    description: "",
    services: services.map((s) => ({service: s, description: ""})),
  }));

  return JSON.stringify(result);
});
