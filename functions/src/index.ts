import {SecretManagerServiceClient} from "@google-cloud/secret-manager";
import * as functions from "firebase-functions";
import axios from "axios";
import {initializeApp} from "firebase-admin/app";
import {firestore} from "firebase-admin";
import {Configuration, OpenAIApi} from "openai";

initializeApp();

const db = firestore();

/**
 * Retrieves the latest version of a secret from Google Cloud Secret Manager.
 * @async
 * @param {String} params - The name of the secret to retrieve.
 * @return {Promise<String>} - The secret's payload data as a string.
 */
async function getSecretsClient(params) {
  const projectId = "247644706560";
  const client = new SecretManagerServiceClient();

  // Get the secret
  const [version] = await client.accessSecretVersion({
    name: `projects/${projectId}/secrets/${params}/versions/latest`,
  });

  // Convert the payload data to a string and return it
  return version.payload.data.toString();
}

/**
 * Retrieves the OpenAI client with the appropriate API key and organization.
 * @async
 * @return {Promise<OpenAIApi>} - The OpenAI client.
 */
async function getOpenaiClient() {
  // Get the organization and OpenAI API key from Google Cloud Secret Manager
  const orgKey = await getSecretsClient("orgKey");
  const secretValue = await getSecretsClient("openAI_api_key");

  // Create a new configuration object with the retrieved keys
  const configuration = new Configuration({
    organization: orgKey,
    apiKey: secretValue,
  });

  // Create and return a new OpenAI client using the configuration object
  return new OpenAIApi(configuration);
}

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
    console.log("🚀 ~ file: index.ts:64 ~ getCombinedData ~ error:", error);
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
    console.log("🚀 ~ file: index.ts:82 ~ getCloudData ~ error:", error);
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
    console.log("🚀 ~ file: index.ts:100 ~ getNetworkingData ~ error:", error);
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
    console.log("🚀 ~ file: index.ts:118 ~ getDatabaseData ~ error:", error);
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
    console.log("🚀 ~ file: index.ts:136 ~ getSecurityData ~ error:", error);
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
    console.log("🚀 ~ file: index.ts:154 ~ getGCloudData ~ error:", error);
    return "Error in gcloud data API call";
  }
});

//    Gcloud command line data api call.
exports.getDatabaseComparisonQuestions = functions.https.onCall(
  async (data, context) => {
    const url =
      "https://storage.googleapis.com/api-project-371618.appspot.com/" +
      "database_comparison_questions.json";

    try {
      const response = await axios.get(url);
      if (response.status === 200) {
        return JSON.stringify(response.data);
      } else {
        return response.status;
      }
    } catch (error) {
      console.log("🚀 ~ file: index.ts:173 ~ error:", error);
      return "Error in getDatabaseComparisonQuestions data API call";
    }
  }
);

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
    console.log("🚀 ~ file: index.ts:131 ~ getFactsData~ error:", error);
    return "Error in facts data API call";
  }
});

// Lessons api call.
exports.getLessonsData = functions.https.onCall(async (data, context) => {
  const url =
    "https://storage.googleapis.com/api-project-371618.appspot.com/lessons.json";

  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      return JSON.stringify(response.data);
    } else {
      return response.status;
    }
  } catch (error) {
    console.log(
      "🚀 ~ file: index.ts:211 ~ exports.getLessonsData ~ error:",
      error
    );
    return "Error in facts data API call";
  }
});

//  Create new fun facts
exports.createFacts = functions.https.onCall(async (snap, context) => {
  const openai = await getOpenaiClient();
  const service = snap.service;
  const prompt =
    "Tell me 3 interesting facts " +
    "about Google's " +
    service +
    " and here's an example output in a JSON array format " +
    "with double quotes around fun_fact and the response " +
    "[{fun_fact: Did you know that [fact 1 about the GCP service]?}," +
    "{fun_fact: Companies like [fact 2 about the GCP service].}," +
    "{fun_fact: A little known fact about" +
    "[fact 3 about the GCP service]}]";
  const tokenSize = 2000;
  const temp = 0.7;
  const data = {
    model: "text-davinci-003",
    prompt: prompt,
    max_tokens: tokenSize,
    temperature: temp,
  };
  try {
    const response = await openai.createCompletion(data);
    const result = response.data.choices[0].text.trim();
    console.log("🚀 ~ result:", result);
    // Save plain response for troubleshooting
    savePlainResponse(service, result);
    try {
      const jsonResponse = await convertToJSON(result);
      const parsedResponse = JSON.parse(jsonResponse);
      const adjustedResponse = replaceNonFunFactKeys(parsedResponse);
      saveChatGPTResponse(adjustedResponse, service);
    } catch (error) {
      console.log("🚀 ~ file: index.ts:196 ~ error:", error);
    }
  } catch (error) {
    console.log("🚀 ~ file: index.js:193 ~ err:", error);
  }
});

/**
 * Saves the response from ChatGPT to Firestore.
 *
 * @param {string} service The service name in String format.
 * @param {string} result The response from ChatGPT in String format.
 * @return {Promise<void>} A promise that resolved when the response is saved.
 */
async function savePlainResponse(service, result) {
  try {
    db.collection("chatGPT").doc().set({
      service: service,
      response: result,
      timestamp: firestore.FieldValue.serverTimestamp(),
    });
  } catch (error) {
    console.log("🚀 ~ file: index.ts:213 ~ savePlainResponse ~ error:", error);
  }
}

/**
 * Converts the given string to JSON format using OpenAI's
 * text-davinci-003 model.
 * @async
 * @param {String} params - The string to convert to JSON format.
 * @return {Promise<String>} - The string converted to JSON format.
 */
async function convertToJSON(params) {
  // Retrieve the OpenAI client
  const openai = await getOpenaiClient();

  // Set the parameters for the OpenAI API call
  const prompt = "Convert this to json format" + params;
  const tokenSize = 2000;
  const temp = 0.7;
  const data = {
    model: "text-davinci-003",
    prompt: prompt,
    max_tokens: tokenSize,
    temperature: temp,
  };

  try {
    // Call the OpenAI API to convert the string to JSON format
    const response = await openai.createCompletion(data);
    const result = response.data.choices[0].text.trim();
    console.log("🚀 ~ result:", result);
    return result;
  } catch (error) {
    console.log("🚀 ~ file: index.js:193 ~ err:", error);
    return null;
  }
}

/**
 * Replaces any key in each object of a JSON array that is not named
 * "fun_fact" with a new key named "fun_fact".
 *
 * @param {Array<FunFactObject>} jsonArray - The JSON array to be
 * checked and modified.
 * @return {Array<FunFactObject>} - The modified JSON array with each object
 * containing a key named "fun_fact".
 *
 * @interface FunFactObject
 * @property {string} fun_fact - The "fun_fact" key of the object.
 * @property {any} [key: string] - Optional additional keys of the object.
 *
 * @example
 * // returns [{fun_fact: "some fun fact"}, {fun_fact: "another fun fact"}]
 * replaceNonFunFactKeys([{fact: "some fun fact"},
 * {another_fact: "another fun fact"}]);
 */
interface FunFactObject {
  fun_fact: string;
  [key: string]: any;
}

/**
 * Replaces non fun fact keys in a given object array with the
 * value of the first key
 * @param {FunFactObject[]} jsonArray - An array of objects with
 * fun_fact property
 * @return {FunFactObject[]} - An array of objects with only
 * fun_fact property
 */
function replaceNonFunFactKeys(jsonArray: FunFactObject[]): FunFactObject[] {
  for (let i = 0; i < jsonArray.length; i++) {
    const obj = jsonArray[i];
    if (!Object.prototype.hasOwnProperty.call(obj, "fun_fact")) {
      obj.fun_fact = obj[Object.keys(obj)[0]];
      delete obj[Object.keys(obj)[0]];
    }
  }
  return jsonArray;
}

/**
 * Saves the response from ChatGPT to Firestore.
 *
 * @param {string} response The response from ChatGPT in JSON format.
 * @param {string} service The name of the GCP service.
 * @return {Promise<void>} A promise that resolved when the response is saved.
 */
async function saveChatGPTResponse(response, service) {
  const docName = removeCloudAndWhitespace(service);

  // Convert the response to an array of objects
  try {
    // Create an array of Firestore documents and save them
    const documents = response.forEach((item) => {
      const docID = db.collection("services").doc().id;
      // Set new document
      db.collection("services")
        .doc(docName)
        .collection("facts")
        .doc(docID)
        .set({
          fact: item.fun_fact,
          timestamp: firestore.FieldValue.serverTimestamp(),
        });
    });
    console.log("🚀 ~ file: index.ts:240 ~ documents ~ documents:", documents);
  } catch (err) {
    console.log("🚀 ~ file: index.ts:244 ~ saveChatGPTResponse ~ err:", err);
  }
}

/**

Remove all occurrences of "Cloud" and all whitespaces from a given string.
@param {string} str - The input string.
@return {string} - The input string with all occurrences of "Cloud" and
all whitespaces removed.
@example
// returns "HelloWorld"
removeCloudAndWhitespace("Hello Cloud World");
*/
function removeCloudAndWhitespace(str) {
  const regex = /Cloud/g;
  const newStr = str.replace(regex, "").replace(/\s+/g, "");
  return newStr;
}

exports.fetchAPIData = functions.pubsub
  .schedule("every sunday 00:00")
  .onRun(async (context) => {
    // List all api calls
    const apiList = [
      "getCombinedCloudData",
      "getCloudData",
      "getNetworkingData",
      "getDatabaseData",
      "getSecurityData",
      "getGCloudData",
    ];
    try {
      apiList.forEach(async (apiName) => {
        // Update Firestore timestamp
        const timestamp = firestore.FieldValue.serverTimestamp();
        await firestore().collection("apiStatus").doc(apiName).update({
          lastUpdated: timestamp,
        });
      });
    } catch (error) {
      console.log("🚀 ~ file: index.ts:318 ~ .onRun ~ error:", error);
    }
  });

exports.reportGenerator = functions.https.onCall(async (snap, context) => {
  const openai = await getOpenaiClient();
  const title = snap.title;
  const content =
    "Write a 500 word report explaining to a high school student on " + title;
  const model = "gpt-3.5-turbo";
  const role = "user";

  const completion = await openai.createChatCompletion({
    model: model,
    messages: [{role: role, content: content}],
  });

  const reportResponse = completion.data.choices[0].message.content;

  try {
    saveReportToFirestore(reportResponse, title);
  } catch (error) {
    saveReportToFirestore(reportResponse, title);
  }
});

/**

Saves a report to Firestore database.
@async
@function saveReportToFirestore
@param {any} reportResponse - The report data to be saved.
@param {string} title - The title of the report.
@throws {Error} - Throws an error if there was a problem saving
the report to Firestore.
@return {Promise<void>}
*/
async function saveReportToFirestore(reportResponse: any, title: string) {
  try {
    const ref = await firestore().collection("reports").add({
      content: reportResponse,
      timestamp: firestore.FieldValue.serverTimestamp(),
      title: title,
    });
    ref.update({
      docID: ref.id,
    });
  } catch (error) {
    console.log(
      "🚀 ~ file: index.ts:435 ~ saveReportToFirestore ~ error:",
      error
    );
  }
}

exports.updateTags = functions.firestore
  .document("reports/{doc}")
  .onCreate(async (snap, context) => {
    const openai = await getOpenaiClient();
    const doc = context.params.doc;
    const snapshot = snap.data();
    const report = snapshot.content;
    const docRef = firestore().collection("reports").doc(doc);

    const content =
      report +
      " Create tags for this report to identify it " +
      "in a search. List them as a json array.";
    const model = "gpt-3.5-turbo";
    const role = "user";

    try {
      const completion = await openai.createChatCompletion({
        model: model,
        messages: [{role: role, content: content}],
      });
      const tagResponse = completion.data.choices[0].message.content;
      const tagArray = JSON.parse(tagResponse);
      console.log(
        "🚀 ~ file: index.ts:525 ~ exports.reportGenerator ~ tagResponse:",
        tagArray
      );
      await docRef.update({
        tags: tagArray,
      });
    } catch (error) {
      console.log(
        "🚀 ~ file: index.ts:534 ~ exports.updateTags ~ error:",
        error
      );
    }
  });

exports.databaseSolutionGenerator = functions.firestore
  .document("databaseComparison/{docID}")
  .onCreate(async (snap, context) => {
    const openai = await getOpenaiClient();
    const docID = context.params.docID;
    const docRef = firestore().collection("databaseComparison").doc(docID);
    const snapshot = snap.data();
    interface MapType {
      question: string;
      answer: string;
    }
    try {
      // Assuming 'snap' is a DocumentSnapshot object
      const answers: MapType[] = snapshot.answersSelected;
      console.log("🚀 ~ file: index.ts:530 ~ .onCreate ~ answers:", answers);
      const answerList: string[] = answers.map((map: MapType) => map.answer);
      const answerString: string = answerList.join(" ");
      const content =
        "Give suggestions on what GCP database service would be " +
        `best suited given the following parameters: ${answerString} ` +
        "First list the suggestions then offer reasons why and lastly " +
        "list comparable services on AWS and Azure.";
      const model = "gpt-3.5-turbo";
      const role = "user";

      const completion = await openai.createChatCompletion({
        model,
        messages: [{role, content}],
      });
      const response = completion.data.choices[0].message.content;

      try {
        docRef.update({
          answer: response,
          timestamp: firestore.FieldValue.serverTimestamp(),
        });
      } catch (error) {
        console.log(
          "🚀 ~ file: index.ts:551 ~ databaseSolutionGenerator ~ error:",
          error
        );
      }
    } catch (error) {
      console.log("🚀 ~ file: index.ts:558 ~ .onCreate ~ error:", error);
    }
  });
