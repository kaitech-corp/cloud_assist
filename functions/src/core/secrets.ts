import {SecretManagerServiceClient} from "@google-cloud/secret-manager";
import {OpenAI} from "openai";

/**
 * Retrieves the latest version of a secret from Google Cloud Secret Manager.
 * @async
 * @param {string} params - The name of the secret to retrieve.
 * @return {Promise<string>} - The secret's payload data as a string.
 */
export async function getSecretsClient(params: string): Promise<string> {
  const projectId = process.env.GCLOUD_PROJECT;
  if (!projectId) {
    throw new Error("GCLOUD_PROJECT environment variable is not set.");
  }
  const client = new SecretManagerServiceClient();

  // Get the secret
  const [version] = await client.accessSecretVersion({
    name: `projects/${projectId}/secrets/${params}/versions/latest`,
  });

  if (!version.payload || !version.payload.data) {
    throw new Error(`Secret ${params} not found or empty.`);
  }

  // Convert the payload data to a string and return it
  return version.payload.data.toString();
}

/**
 * Retrieves the OpenAI client with the appropriate API key and organization.
 * @async
 * @return {Promise<OpenAI>} - The OpenAI client.
 */
export async function getOpenaiClient(): Promise<OpenAI> {
  // Get the organization and OpenAI API key from Google Cloud Secret Manager
  const orgKey = await getSecretsClient("orgKey");
  const secretValue = await getSecretsClient("openAI_api_key");

  // Create and return a new OpenAI client using the configuration object
  return new OpenAI({organization: orgKey, apiKey: secretValue});
}
