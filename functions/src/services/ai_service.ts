/* eslint-disable @typescript-eslint/no-explicit-any */
import {GoogleGenAI, Type} from "@google/genai";
import {HttpsError} from "firebase-functions/v2/https";
import {getOpenaiClient} from "../core/secrets";

export interface DiscoveredService {
  service: string;
  type: string;
}

export interface ReportAnalysis {
  shouldUpdate: boolean;
  verified: boolean;
  reasoningMatches: boolean;
  reason: string;
  replacementText?: string;
  replacementList?: string[];
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
  type: Type.OBJECT,
  properties: {
    service: {type: Type.STRING},
    description: {type: Type.STRING},
    detail: {type: Type.STRING},
    benefits: {type: Type.ARRAY, items: {type: Type.STRING}},
    cons: {type: Type.ARRAY, items: {type: Type.STRING}},
    useCases: {type: Type.ARRAY, items: {type: Type.STRING}},
    link: {type: Type.STRING, format: "uri"},
    example: {type: Type.STRING},
    type: {type: Type.STRING},
  },
  required: [
    "service", "description", "detail", "benefits",
    "cons", "useCases", "link", "example", "type",
  ],
};

/**
 * Creates a Google Gen AI client backed by Gemini Enterprise/Vertex auth.
 * @return {GoogleGenAI} Configured Google Gen AI client.
 */
function getGoogleGenAIClient(): GoogleGenAI {
  return new GoogleGenAI({
    enterprise: true,
    project: process.env.GCLOUD_PROJECT,
    location: "us-central1",
  });
}

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
 * Generates structured service data using Google Gen AI (Gemini).
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
    const ai = getGoogleGenAIClient();
    const response = await ai.models.generateContent({
      model: "gemini-2.5-flash",
      contents: prompt,
      config: {
        responseMimeType: "application/json",
        responseSchema: SERVICE_DATA_VERTEX_SCHEMA,
      },
    });
    const text = response.text;
    if (!text) {
      throw new HttpsError("unavailable", "Gemini returned empty response.");
    }
    return JSON.parse(text);
  } catch (error: any) {
    throw new HttpsError("unavailable", "Gemini error: " + error.message);
  }
}

/**
 * Uses Google Gen AI with Google Search grounding to discover the current list
 * of services for a given cloud provider.
 * @param {string} cloudProvider - Cloud provider name (GCP, AWS, Azure).
 * @return {Promise<DiscoveredService[]>} Array of discovered services.
 */
export async function discoverCloudServices(
  cloudProvider: string,
): Promise<DiscoveredService[]> {
  const ai = getGoogleGenAIClient();

  const prompt =
    `List all current ${cloudProvider} cloud services available today. ` +
    "Return ONLY a valid JSON array — no markdown fences, no explanation. " +
    "Each element: {\"service\": \"<name>\", \"type\": \"<category>\"}. " +
    "Categories must be one of: compute, storage, database, networking, " +
    "security, ai_ml, devops, analytics, identity, monitoring, other.";

  try {
    const result = await ai.models.generateContent({
      model: "gemini-2.5-flash",
      contents: prompt,
      config: {
        tools: [{googleSearch: {}}],
      },
    });
    const raw = result.text || "[]";
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

/**
 * Analyzes a user content report and proposes a verified correction only when
 * the report is specific enough and the correction can be grounded.
 *
 * @param {object} params - Report and current service content.
 * @param {string} params.service - Service name.
 * @param {string} params.provider - Cloud provider name.
 * @param {string} params.field - Service field being reported.
 * @param {string} params.reportType - User-selected report reason.
 * @param {string | string[]} params.currentValue - Current service field value.
 * @return {Promise<ReportAnalysis>} Structured report analysis.
 */
export async function analyzeReportedServiceContent(params: {
  service: string;
  provider: string;
  field: string;
  reportType: string;
  currentValue: string | string[];
}): Promise<ReportAnalysis> {
  const ai = getGoogleGenAIClient();

  const valueType = Array.isArray(params.currentValue) ? "array" : "string";
  const prompt = [
    "You review cloud service educational content reports.",
    "Use Google Search grounding when current facts are needed.",
    "Only approve an update when the report reason matches the content issue",
    "and the correction can be verified. If verification is weak, uncertain,",
    "or the reason does not match, return shouldUpdate false.",
    "Return ONLY valid JSON with this shape:",
    "{\"shouldUpdate\": boolean, \"verified\": boolean,",
    "\"reasoningMatches\": boolean, \"reason\": string,",
    "\"replacementText\": string, \"replacementList\": string[]}.",
    "For array fields, replacementList must be the complete replacement array,",
    "not one item. Do not include numbering, bullets, markdown, citations,",
    "or nested lists inside list items. For example fields, return plain text",
    "that will display correctly as a paragraph or short code-free example.",
    `Service: ${params.service}`,
    `Provider: ${params.provider}`,
    `Field: ${params.field}`,
    `Field value type: ${valueType}`,
    `Report reason: ${params.reportType}`,
    `Current field value: ${JSON.stringify(params.currentValue)}`,
  ].join("\n");

  const result = await ai.models.generateContent({
    model: "gemini-2.5-flash",
    contents: prompt,
    config: {
      tools: [{googleSearch: {}}],
    },
  });
  const raw = result.text || "{}";
  const jsonMatch = raw.match(/\{[\s\S]*\}/);
  if (!jsonMatch) {
    return {
      shouldUpdate: false,
      verified: false,
      reasoningMatches: false,
      reason: "The analysis did not return parseable JSON.",
    };
  }

  try {
    const parsed = JSON.parse(jsonMatch[0]) as ReportAnalysis;
    return {
      shouldUpdate: parsed.shouldUpdate === true,
      verified: parsed.verified === true,
      reasoningMatches: parsed.reasoningMatches === true,
      reason: parsed.reason || "No reason provided.",
      replacementText: parsed.replacementText,
      replacementList: Array.isArray(parsed.replacementList) ?
        parsed.replacementList : undefined,
    };
  } catch (error: any) {
    return {
      shouldUpdate: false,
      verified: false,
      reasoningMatches: false,
      reason: "The analysis JSON could not be parsed: " + error.message,
    };
  }
}
