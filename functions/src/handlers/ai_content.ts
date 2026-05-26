/* eslint-disable @typescript-eslint/no-explicit-any */
import {firestore} from "firebase-admin";
import {onDocumentCreated} from "firebase-functions/firestore";
import {HttpsError, onCall} from "firebase-functions/v2/https";
import {db} from "../core/config";
import {getOpenaiClient} from "../core/secrets";
import {removeCloudAndWhitespace} from "../services/utils";
import {
  savePlainResponse,
  saveChatGPTResponse,
  saveServiceFact,
  saveReportToFirestore,
  saveServiceDataToFirestore,
  updateFirestoreDocumentField,
} from "../services/firestore_service";
import {
  generateFacts,
  generateServiceDataOpenAI,
  generateServiceDataVertex,
} from "../services/ai_service";

/**
 * Automatically generates fun facts for a new service document.
 */
export const createFacts = onDocumentCreated("services/{doc}",
  async (event) => {
    try {
      const snapshot = event.data;
      if (!snapshot) return;
      const service = snapshot.data().service;
      const resultText = await generateFacts(service);
      console.log("🚀 ~ createFacts result:", resultText);
      await savePlainResponse(service, resultText);
      await saveChatGPTResponse(JSON.parse(resultText), service);
    } catch (error) {
      console.error("Error in createFacts function:", error);
    }
  });

/**
 * Manually trigger fun fact generation for a service.
 */
export const createNewFactsManually = onCall(async (request) => {
  if (!request.auth?.uid) {
    throw new HttpsError("permission-denied", "User is not authenticated.");
  }
  const service = request.data.service;
  try {
    const result = await generateFacts(service);
    await savePlainResponse(service, result);
    await saveChatGPTResponse(JSON.parse(result), service);
  } catch (error) {
    console.log("🚀 ~ createNewFactsManually ~ error:", error);
  }
});

/**
 * Create new facts with a custom prompt.
 */
export const createNewFacts = onCall(async (request) => {
  if (!request.auth?.uid) {
    throw new HttpsError("permission-denied", "User is not authenticated.");
  }
  const openai = await getOpenaiClient();
  const service = request.data.service;
  const prompt = request.data.prompt.toString();
  try {
    const response = await openai.chat.completions.create({
      model: "gpt-4o-mini",
      messages: [
        {role: "system", content: "Cloud Computing Expert"},
        {role: "user", content: prompt},
      ],
    });
    const result = response.choices[0].message.content?.trim() || "";
    await savePlainResponse(service, result);
    await saveServiceFact(result, service);
  } catch (error) {
    console.log("🚀 ~ createNewFacts ~ error:", error);
  }
});

/**
 * Generates reports based on a title.
 */
export const reportGenerator = onCall(async (request) => {
  if (!request.auth?.uid) {
    throw new HttpsError("permission-denied", "User is not authenticated.");
  }
  const openai = await getOpenaiClient();
  const title = request.data.title.toString();
  const content =
    "Write a 500 word report explaining to a high school student on " + title;
  const completion = await openai.chat.completions.create({
    model: "gpt-4o-mini",
    messages: [{role: "user", content: content}],
  });
  const reportResponse = completion.choices[0].message.content || "";
  await saveReportToFirestore(reportResponse, title);
});

/**
 * Updates tags for a report using AI.
 */
export const updateTags = onDocumentCreated("reports/{doc}", async (event) => {
  const openai = await getOpenaiClient();
  const doc = event.params.doc;
  const snapshot = event.data?.data();
  if (!snapshot) return;
  const report = snapshot.content;
  const docRef = db.collection("reports").doc(doc);
  const content = report +
    " Create tags for this report to identify it in a search. " +
    "List them as a json array.";
  try {
    const completion = await openai.chat.completions.create({
      model: "gpt-4o-mini",
      messages: [{role: "user", content: content}],
    });
    const tagResponse = completion.choices[0].message.content || "[]";
    const tagArray = JSON.parse(tagResponse);
    await docRef.update({tags: tagArray});
  } catch (error) {
    console.log("🚀 ~ updateTags ~ error:", error);
  }
});

/**
 * Generates database recommendations based on user answers.
 */
export const databaseSolutionGenerator = onDocumentCreated(
  "databaseComparison/{docID}", async (event) => {
    const openai = await getOpenaiClient();
    const docID = event.params.docID;
    const docRef = db.collection("databaseComparison").doc(docID);
    const snapshot = event.data?.data();
    if (!snapshot) return;

    interface MapType {
      question: string;
      answer: string;
    }

    try {
      const answers: MapType[] = snapshot.answersSelected;
      const answerString = answers.map((m: MapType) => m.answer).join(" ");
      const content = "Please provide detailed recommendations for the " +
        "best database service based on the following parameters: " +
        `${answerString}. Your response must include: Description, ` +
        "Suggestions, Reasons, Comparable Services. Format as plain text " +
        "with section headings and no markdown.";
      const completion = await openai.chat.completions.create({
        model: "gpt-4o-mini",
        messages: [{role: "user", content: content}],
      });
      const response = completion.choices[0].message.content;
      await docRef.update({
        answer: response,
        timestamp: firestore.FieldValue.serverTimestamp(),
      });
    } catch (error) {
      console.log("🚀 ~ databaseSolutionGenerator ~ error:", error);
    }
  });

/**
 * Generates structured service data using OpenAI or Vertex AI.
 */
export const serviceDataGenerator = onCall(async (request) => {
  if (!request.auth?.uid) {
    throw new HttpsError("permission-denied", "User is not authenticated.");
  }
  const {service, serviceType, provider} = request.data;
  if (!service || !serviceType || !provider) {
    throw new HttpsError("invalid-argument",
      "Missing service, serviceType, or provider.");
  }

  let parsed: any;
  if (provider === "openai") {
    parsed = await generateServiceDataOpenAI(service, serviceType);
  } else if (provider === "google") {
    parsed = await generateServiceDataVertex(service, serviceType);
  } else {
    throw new HttpsError("invalid-argument",
      "Invalid provider. Must be 'openai' or 'google'.");
  }

  await saveServiceDataToFirestore(parsed, service, provider);
  return parsed;
});

/**
 * Updates a specific field of a service document using AI.
 */
export const updateServiceField = onCall(async (request) => {
  if (!request.auth?.uid) {
    throw new HttpsError("permission-denied", "User is not authenticated.");
  }
  const openai = await getOpenaiClient();
  const service = request.data.service;
  const docID = removeCloudAndWhitespace(service);
  const field = request.data.field;
  const provider = request.data.provider;

  const arrayDescription =
    "Each item in the array must be a string with at least 30 words.";

  const responseFormat: any = {
    type: "json_schema",
    json_schema: {
      name: "service_data_response",
      schema: {type: "object", properties: {}, required: []},
    },
  };

  let content = "";
  switch (field) {
  case "description":
    content = "Generate a concise description (12 words or less) " +
        `for the ${provider} service ${service}.`;
    responseFormat.json_schema.schema.properties = {
      description: {type: "string"},
    };
    responseFormat.json_schema.schema.required = ["description"];
    break;
  case "detail":
    content = "Provide a detailed explanation for the " +
        `${provider} service ${service}.`;
    responseFormat.json_schema.schema.properties = {detail: {type: "string"}};
    responseFormat.json_schema.schema.required = ["detail"];
    break;
  case "benefits":
    content = `List benefits of the ${provider} service ${service}. ` +
        arrayDescription;
    responseFormat.json_schema.schema.properties = {
      benefits: {type: "array", items: {type: "string"}},
    };
    responseFormat.json_schema.schema.required = ["benefits"];
    break;
  case "cons":
    content = `List cons of the ${provider} service ${service}. ` +
        arrayDescription;
    responseFormat.json_schema.schema.properties = {
      cons: {type: "array", items: {type: "string"}},
    };
    responseFormat.json_schema.schema.required = ["cons"];
    break;
  case "useCases":
    content = `List use cases of the ${provider} service ${service}. ` +
        arrayDescription;
    responseFormat.json_schema.schema.properties = {
      useCases: {type: "array", items: {type: "string"}},
    };
    responseFormat.json_schema.schema.required = ["useCases"];
    break;
  default:
    return;
  }

  const completion = await openai.chat.completions.create({
    model: "gpt-4o-mini",
    messages: [{role: "user", content: content}],
    response_format: responseFormat,
  });
  const response = completion.choices[0].message.content;
  if (response) {
    await updateFirestoreDocumentField(response, docID, field);
  }
});
