import {SecretManagerServiceClient} from "@google-cloud/secret-manager";
import * as functions from "firebase-functions";
import axios from "axios";
import {initializeApp} from "firebase-admin/app";
initializeApp();

//  Combined data api call.
exports.getCombinedData = functions.https.onCall(async (data, context) => {
  const url =
    "https://storage.googleapis.com/api-project-371618.appspot.com/combined_data.json";

  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      return JSON.stringify(response.data);
    } else {
      return response.status;
    }
  } catch (error) {
    console.error(`Error in combined cloud data API call: ${error}`);
    return "Error in combined cloud data API call";
  }
});

//  Cloud data api call.
exports.getCloudData = functions.https.onCall(async (data, context) => {
  const url =
    "https://storage.googleapis.com/api-project-371618.appspot.com/cloud_data.json";

  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      return JSON.stringify(response.data);
    } else {
      return response.status;
    }
  } catch (error) {
    console.error(`Error in cloud data API call: ${error}`);
    return "Error in cloud data API call";
  }
});

//    Networking data api call.
exports.getNetworkingData = functions.https.onCall(async (data, context) => {
  const url =
    "https://storage.googleapis.com/api-project-371618.appspot.com/cloud_networking.json";

  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      return JSON.stringify(response.data);
    } else {
      return response.status;
    }
  } catch (error) {
    console.error(`Error in cloud networking data API call: ${error}`);
    return "Error in cloud networking data API call";
  }
});

//    Database data api call.
exports.getDatabaseData = functions.https.onCall(async (data, context) => {
  const url =
    "https://storage.googleapis.com/api-project-371618.appspot.com/database_data.json";

  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      return JSON.stringify(response.data);
    } else {
      return response.status;
    }
  } catch (error) {
    console.error(`Error in cloud database data API call: ${error}`);
    return "Error in cloud database data API call";
  }
});

//    Security data api call.
exports.getSecurityData = functions.https.onCall(async (data, context) => {
  const url =
    "https://storage.googleapis.com/api-project-371618.appspot.com/security_data.json";

  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      return JSON.stringify(response.data);
    } else {
      return response.status;
    }
  } catch (error) {
    console.error(`Error in cloud security data API call: ${error}`);
    return "Error in cloud security data API call";
  }
});

//    Gcloud command line data api call.
exports.getGCloudData = functions.https.onCall(async (data, context) => {
  const url =
    "https://storage.googleapis.com/api-project-371618.appspot.com/cmd_line_cheat_sheet.json";

  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      return JSON.stringify(response.data);
    } else {
      return response.status;
    }
  } catch (error) {
    console.error(`Error in gcloud data API call: ${error}`);
    return "Error in gcloud data API call";
  }
});

//    Facts api call.
exports.getFactsData = functions.https.onCall(async (data, context) => {
  const url =
    "https://storage.googleapis.com/api-project-371618.appspot.com/facts.json";

  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      return JSON.stringify(response.data);
    } else {
      return response.status;
    }
  } catch (error) {
    console.error(`Error in facts data API call: ${error}`);
    return "Error in facts data API call";
  }
});

//  Create new fun facts
exports.createFacts = functions.https.onCall(async (snap, context) => {
  const service = snap.service;
  const prompt =
    "Tell me 3 interesting facts\n" +
    "about Google Cloud's " +
    service +
    "}\n" +
    "And here's an example output in a JSON array format:\n" +
    "[{'fun_fact': 'Did you know that [fact 1 about the GCP service]?'},\n" +
    "{'fun_fact': 'Companies like [fact 2 about the GCP service].'},\n" +
    "{'fun_fact': 'A little known fact about'" +
    "[fact 3 about the GCP service]}]";
  const tokenSize = 2000;
  const temp = 0.7;
  const uri = "https://api.openai.com/v1/completions";
  const data = {
    "model": "text-davinci-003",
    "prompt": prompt,
    "max_tokens": tokenSize,
    "temperature": temp,
  };
  try {
    // Set up Secret Manager client
    const projectId = "247644706560";
    const client = new SecretManagerServiceClient();

    // Get the secret
    const name = "openAI_api_key";
    const [version] = await client.accessSecretVersion({
      name: `projects/${projectId}/secrets/${name}/versions/latest`,
    });
    const secretValue = version.payload.data.toString();

    const config = {
      headers: {
        "Authorization": `Bearer ${secretValue}`,
        "Content-Type": "application/json",
      },
    };
    // Do something with the secret value
    console.log(`My secret is ${secretValue}`);
    const response = await axios.post(uri, data, config);
    const result = response.data;
    console.log(result);
  } catch (err) {
    console.error(err);
  }
});
