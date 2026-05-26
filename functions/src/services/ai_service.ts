/* eslint-disable @typescript-eslint/no-explicit-any */
import {SchemaType, VertexAI} from "@google-cloud/vertexai";
import {HttpsError} from "firebase-functions/v2/https";
import {getOpenaiClient} from "../core/secrets";

export interface DiscoveredService {
  service: string;
  type: string;
}

export const FACTS_OPENAI_SCHEMA = {
  name: "my_response",
  schema: {
    type: "array",
    items: {
      type: "object",
      properties: {fun_fact: {type: "string"}},
      required: ["fun_fact"],
    },
    minItems: 5,
    maxItems: 5,
  },
};

export const SERVICE_DATA_OPENAI_SCHEMA = {
  name: "service_data_response",
  schema: {
    type: "object",
    properties: {
      service: {type: "string"},
      description: {type: "string"},
      detail: {type: "string"},
      benefits: {type: "array", items: {type: "string"}},
      cons: {type: "array", items: {type: "string"}},
      useCases: {type: "array", items: {type: "string"}},
      link: {type: "string", format: "uri"},
      example: {type: "string"},
      type: {type: "string"},
    },
    required: [
      "service", "description", "detail", "benefits",
      "cons", "useCases", "link", "example", "type",
    ],
  },
};

export const SERVICE_DATA_VERTEX_SCHEMA = {
  type: SchemaType.OBJECT,
  properties: {
    service: {type: SchemaType.STRING},
    description: {type: SchemaType.STRING},
    detail: {type: SchemaType.STRING},
    benefits: {type: SchemaType.ARRAY, items: {type: SchemaType.STRING}},
    cons: {type: SchemaType.ARRAY, items: {type: SchemaType.STRING}},
    useCases: {type: SchemaType.ARRAY, items: {type: SchemaType.STRING}},
    link: {type: SchemaType.STRING, format: "uri"},
    example: {type: SchemaType.STRING},
    type: {type: SchemaType.STRING},
  },
  required: [
    "service", "description", "detail", "benefits",
    "cons", "useCases", "link", "example", "type",
  ],
};

/**
 * Builds the prompt for service data generation.
 * @param {string} service - The service name.
 * @param {string} serviceType - The service type category.
 * @return {string} The prompt string.
 */
function buildServiceDataPrompt(service: string, serviceType: string): string {
  return `Generate detailed information for the service "${service}".
Please include: service name, description (12 words or less), detail, ` +
    "benefits (at least 30 words each), cons (at least 30 words each), " +
    `use cases, link (URI), example, and type (must be "${serviceType}"). ` +
    "Output as JSON.";
}

/**
 * Generates 5 fun facts for a cloud service using OpenAI.
 * @param {string} service - The service name.
 * @return {Promise<string>} Raw JSON string from the model.
 */
export async function generateFacts(service: string): Promise<string> {
  const openai = await getOpenaiClient();
  const response = await openai.chat.completions.create({
    model: "gpt-4o-mini",
    messages: [
      {role: "system", content: "Cloud Computing Expert"},
      {role: "user", content: `Tell me 5 interesting facts about ${service}.`},
    ],
    response_format: {type: "json_schema", json_schema: FACTS_OPENAI_SCHEMA},
  });
  return response.choices[0].message.content?.trim() || "[]";
}

/**
 * Generates structured service data using OpenAI.
 * @param {string} service - The service name.
 * @param {string} serviceType - The service type category.
 * @return {Promise<any>} Parsed service data object.
 */
export async function generateServiceDataOpenAI(
  service: string,
  serviceType: string,
): Promise<any> {
  const openai = await getOpenaiClient();
  const prompt = buildServiceDataPrompt(service, serviceType);
  try {
    const completion = await openai.chat.completions.create({
      model: "gpt-4o-mini",
      messages: [{role: "user", content: prompt}],
      response_format: {
        type: "json_schema",
        json_schema: SERVICE_DATA_OPENAI_SCHEMA,
      },
    });
    const content = completion.choices[0].message.content;
    if (!content) {
      throw new HttpsError("unavailable", "OpenAI returned empty response.");
    }
    return JSON.parse(content);
  } catch (error: any) {
    throw new HttpsError("unavailable", "OpenAI error: " + error.message);
  }
}

/**
 * Generates structured service data using Vertex AI (Gemini).
 * @param {string} service - The service name.
 * @param {string} serviceType - The service type category.
 * @return {Promise<any>} Parsed service data object.
 */
export async function generateServiceDataVertex(
  service: string,
  serviceType: string,
): Promise<any> {
  const prompt = buildServiceDataPrompt(service, serviceType);
  try {
    const vertexAI = new VertexAI({
      project: process.env.GCLOUD_PROJECT,
      location: "us-central1",
    });
    const model = vertexAI.getGenerativeModel({
      model: "gemini-1.5-pro-005",
      generationConfig: {
        responseMimeType: "application/json",
        responseSchema: SERVICE_DATA_VERTEX_SCHEMA,
      },
    });
    const response = await model.generateContent(prompt);
    const text = response.response.candidates?.[0].content.parts[0].text;
    if (!text) {
      throw new HttpsError("unavailable", "Vertex AI returned empty response.");
    }
    return JSON.parse(text);
  } catch (error: any) {
    throw new HttpsError("unavailable", "Vertex AI error: " + error.message);
  }
}

/**
 * Uses Vertex AI with Google Search grounding to discover the current list
 * of services for a given cloud provider.
 * @param {string} cloudProvider - Cloud provider name (GCP, AWS, Azure).
 * @return {Promise<DiscoveredService[]>} Array of discovered services.
 */
export async function discoverCloudServices(
  cloudProvider: string,
): Promise<DiscoveredService[]> {
  const vertexAI = new VertexAI({
    project: process.env.GCLOUD_PROJECT,
    location: "us-central1",
  });

  // googleSearchRetrieval grounds the model against live web results,
  // bypassing the training cutoff for service discovery.
  const model = vertexAI.getGenerativeModel({
    model: "gemini-1.5-pro-005",
    tools: [{googleSearchRetrieval: {}}],
  });

  const prompt =
    `List all current ${cloudProvider} cloud services available today. ` +
    "Return ONLY a valid JSON array — no markdown fences, no explanation. " +
    "Each element: {\"service\": \"<name>\", \"type\": \"<category>\"}. " +
    "Categories must be one of: compute, storage, database, networking, " +
    "security, ai_ml, devops, analytics, identity, monitoring, other.";

  try {
    const result = await model.generateContent(prompt);
    const raw =
      result.response.candidates?.[0].content.parts[0].text || "[]";
    const jsonMatch = raw.match(/\[[\s\S]*\]/);
    if (!jsonMatch) return [];
    return JSON.parse(jsonMatch[0]) as DiscoveredService[];
  } catch (error: any) {
    console.error(
      `discoverCloudServices failed for ${cloudProvider}:`, error,
    );
    return [];
  }
}
