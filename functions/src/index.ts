import {SecretManagerServiceClient} from "@google-cloud/secret-manager";
import * as functions from "firebase-functions";
import axios from "axios";
import {initializeApp} from "firebase-admin/app";
import {firestore} from "firebase-admin";
import {Configuration, OpenAIApi} from "openai";
import {FieldValue} from "firebase-admin/firestore";

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
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
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
    console.log("🚀 ~ file: index.ts:70 ~ getCombinedData ~ error:", error);
    return "Error in combined cloud data API call";
  }
});

//  Cloud data api call.
exports.getCloudData = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
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
    console.log("🚀 ~ file: index.ts:94 ~ getCloudData ~ error:", error);
    return "Error in cloud data API call";
  }
});

//    Networking data api call.
exports.getNetworkingData = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
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
    console.log("🚀 ~ file: index.ts:118 ~ getNetworkingData ~ error:", error);
    return "Error in cloud networking data API call";
  }
});

//    Database data api call.
exports.getDatabaseData = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
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
    console.log("🚀 ~ file: index.ts:142 ~ getDatabaseData ~ error:", error);
    return "Error in cloud database data API call";
  }
});

//    Security data api call.
exports.getSecurityData = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
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
    console.log("🚀 ~ file: index.ts:166 ~ getSecurityData ~ error:", error);
    return "Error in cloud security data API call";
  }
});

//    Gcloud command line data api call.
exports.getGCloudData = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
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
    console.log("🚀 ~ file: index.ts:190 ~ getGCloudData ~ error:", error);
    return "Error in gcloud data API call";
  }
});

//    Gcloud command line data api call.
exports.getDatabaseComparisonQuestions = functions.https.onCall(
  async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Unable to perform action."
      );
    }
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
      console.log("🚀 ~ file: index.ts:216 ~ error:", error);
      return "Error in getDatabaseComparisonQuestions data API call";
    }
  }
);

//    gcp service list data api call.
exports.getGcpServiceList = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
  const url =
    "https://storage.googleapis.com/api-project-371618.appspot.com/" +
    "gcp_service_list.json";

  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      return JSON.stringify(response.data);
    } else {
      return response.status;
    }
  } catch (error) {
    console.log("🚀 ~ file: index.ts:243 ~ error:", error);
    return "Error in getGcpServiceList data API call";
  }
});

//    Facts api call.
exports.getFactsData = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
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
    console.log("🚀 ~ file: index.ts:268 ~ getFactsData~ error:", error);
    return "Error in facts data API call";
  }
});

// Lessons api call.
exports.getLessonsData = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
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
      "🚀 ~ file: index.ts:292 ~ exports.getLessonsData ~ error:",
      error
    );
    return "Error in facts data API call";
  }
});
/**
 * Removes all text outside of a JSON format.
 *
 * @param {string} text - The input text that may contain JSON.
 * @return {string} - The JSON substring extracted from the input text.
 */
function removeNonJSONText(text: string) {
  // Find the first occurrence of a curly brace
  const startIndex = text.indexOf("[");

  // Find the last occurrence of a curly brace
  const lastIndex = text.lastIndexOf("]");

  // Extract the JSON substring
  const json = text.substring(startIndex, lastIndex + 1);

  // Return the JSON substring
  return json;
}

//  Create new fun facts
exports.createFacts = functions.firestore
  .document("services/{doc}")
  .onCreate(async (snap, context) => {
    const openai = await getOpenaiClient();
    const snapshot = snap.data();
    const service = snapshot.service;
    const prompt =
      "Tell me 5 interesting facts " +
      "about " +
      service +
      "return response in json list format using the following schema: [" +
      "\"fun_fact\": \"Did you know that [fact 1]?\",\n" +
      "\"fun_fact\": \"Companies like [fact 2].\",\n" +
      "\"fun_fact\": \"An interesting fact about [fact 3]\",\n" +
      "\"fun_fact\": \"A comparable service using [fact 4]?\",\n" +
      "\"fun_fact\": \"A comparable service using [fact 5]}.\"]";

    try {
      const response = await openai.createChatCompletion({
        model: "gpt-3.5-turbo-0613",
        messages: [
          {role: "system", content: "Cloud Computing Expert"},
          {role: "user", content: prompt},
        ],
      });
      const result = response.data.choices[0].message.content.trim();
      console.log("🚀 ~ result:", result);
      // Save plain response for troubleshooting
      savePlainResponse(service, result);
      try {
        const jsonResponse = await removeNonJSONText(result);
        const parsedResponse = JSON.parse(jsonResponse);
        const adjustedResponse = replaceNonFunFactKeys(parsedResponse);
        saveChatGPTResponse(adjustedResponse, service);
      } catch (error) {
        console.log("🚀 ~ file: index.ts:337 ~ error:", error);
        const jsonResponse = await convertToJSON(result);
        const parsedResponse = JSON.parse(jsonResponse);
        const adjustedResponse = replaceNonFunFactKeys(parsedResponse);
        saveChatGPTResponse(adjustedResponse, service);
      }
    } catch (error) {
      console.log("🚀 ~ file: index.js:340 ~ error:", error);
    }
  });

//  Manually create new fun facts
exports.createNewFactsManually = functions.https.onCall(
  async (snap, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Unable to perform action."
      );
    }
    const openai = await getOpenaiClient();
    const service = snap.service;
    const prompt =
      "Tell me 5 interesting facts " +
      "about " +
      service +
      "return response in json list format using the following schema: [" +
      "\"fun_fact\": \"Did you know that [fact 1]?\",\n" +
      "\"fun_fact\": \"Companies like [fact 2].\",\n" +
      "\"fun_fact\": \"An interesting fact about [fact 3]\",\n" +
      "\"fun_fact\": \"A comparable service using [fact 4]?\",\n" +
      "\"fun_fact\": \"A comparable service using [fact 5]}.\"]";

    try {
      const response = await openai.createChatCompletion({
        model: "gpt-3.5-turbo-0613",
        messages: [
          {role: "system", content: "Cloud Computing Expert"},
          {role: "user", content: prompt},
        ],
      });
      const result = response.data.choices[0].message.content.trim();
      console.log("🚀 ~ result:", result);
      // Save plain response for troubleshooting
      savePlainResponse(service, result);
      try {
        const jsonResponse = await convertToJSON(result);
        const parsedResponse = JSON.parse(jsonResponse);
        const adjustedResponse = replaceNonFunFactKeys(parsedResponse);
        saveChatGPTResponse(adjustedResponse, service);
      } catch (error) {
        console.log("🚀 ~ file: index.ts:337 ~ error:", error);
      }
    } catch (error) {
      console.log("🚀 ~ file: index.js:340 ~ error:", error);
    }
  }
);

//  Create new fun facts
exports.createNewFacts = functions.https.onCall(async (snap, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
  const openai = await getOpenaiClient();
  const service = snap.service;
  const prompt = snap.prompt;

  const tokenSize = 200;
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
    saveServiceFact(result, service);
  } catch (error) {
    console.log("🚀 ~ file: index.ts:372 ~ createNewFacts~ error:", error);
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
    console.log("🚀 ~ file: index.ts:391 ~ savePlainResponse ~ error:", error);
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
  const openai = await getOpenaiClient();
  const prompt = "Remove everything but the json and format it correctly:" +
  params;
  const tokenSize = 2000;
  const temp = 0.3;
  const data = {
    model: "text-davinci-003",
    prompt: prompt,
    max_tokens: tokenSize,
    temperature: temp,
  };

  try {
    const response = await openai.createCompletion(data);
    const result = response.data.choices[0].text.trim();
    console.log("🚀 ~ convertToJSON: completed");
    return result;
  } catch (error) {
    console.error("🚨 ~ convertToJSON:", error.message);
    throw new Error(`Failed to convert '${params}' to JSON: ${error.message}`);
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
    console.log("🚀 ~ file: index.ts:485 ~ documents ~ documents:", documents);
  } catch (error) {
    console.log(
      "🚀 ~ file: index.ts:498 ~ saveChatGPTResponse ~ error:",
      error
    );
  }
}

/**
 * Saves the fact from ChatGPT to Firestore.
 *
 * @param {string} fact The response from ChatGPT in JSON format.
 * @param {string} service The name of the GCP service.
 * @return {Promise<void>} A promise that resolved when the response is saved.
 */
async function saveServiceFact(fact, service) {
  const docName = removeCloudAndWhitespace(service);

  // Convert the response to an array of objects
  try {
    const docID = db.collection("services").doc().id;
    // Set new document
    db.collection("services").doc(docName).collection("facts").doc(docID).set({
      fact: fact,
      timestamp: firestore.FieldValue.serverTimestamp(),
      flag: null,
      docID: docID,
    });

    // Save to quick facts collection.
    const docID2 = db.collection("quickFacts").doc().id;
    // Set new document
    db.collection("quickFacts").doc(docID2).set({
      fact: fact,
      timestamp: firestore.FieldValue.serverTimestamp(),
      flag: null,
      docID: docID,
      service: service,
    });
  } catch (error) {
    console.log("🚀 ~ file: index.ts:540 ~ saveServiceFact ~ error:", error);
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
      console.log("🚀 ~ file: index.ts:581 ~ .onRun ~ error:", error);
    }
  });

exports.reportGenerator = functions.https.onCall(async (snap, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
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
      "🚀 ~ file: index.ts:637 ~ saveReportToFirestore ~ error:",
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
        "🚀 ~ file: index.ts:664 ~ exports.reportGenerator ~ tagResponse:",
        tagArray
      );
      await docRef.update({
        tags: tagArray,
      });
    } catch (error) {
      console.log(
        "🚀 ~ file: index.ts:673 ~ exports.updateTags ~ error:",
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
        "Give suggestions and detailed reasons on what GCP database service " +
        `is best suited given the following parameters: ${answerString}.` +
        "Include Description, Suggestions (list suggestions only), Reasons, " +
        "Comparable services in AWS and Azure";
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
          "🚀 ~ file: index.ts:717 ~ databaseSolutionGenerator ~ error:",
          error
        );
      }
    } catch (error) {
      console.log("🚀 ~ file: index.ts:723 ~ .onCreate ~ error:", error);
    }
  });

exports.createUserDocument = functions.auth.user().onCreate(async (user) => {
  // Get user data from Firebase Authentication
  const {uid, displayName, email, photoURL} = user;

  try {
    // Create user document in Firestore
    await firestore()
      .collection("users")
      .doc(uid)
      .set({
        displayName: displayName || "",
        email: email || "",
        photoURL: photoURL || "",
        uid: uid,
        dateCreated: firestore.FieldValue.serverTimestamp(),
        paid: true,
        // Add any additional fields you want to store in the user document
        // e.g. role, created_at, etc.
      });
    await firestore()
      .collection("userInteraction")
      .doc(uid)
      .set({docID: uid});
    console.log(`User document created for user with UID: ${uid}`);
  } catch (error) {
    console.error(
      `Error creating user document for user with UID: ${uid}`,
      error
    );
  }
});

// Function to create new service document
exports.serviceDataGenerator = functions.https.onCall(async (snap, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
  const openai = await getOpenaiClient();
  const service = snap.service;
  const serviceType = snap.serviceType;
  const provider = snap.provider;
  const content =
    '{service: "", description: "", detail: "",benefits: [],cons: [],' +
    'useCases: [],link: "",example: "",type:""} ' +
    "Generate information that conforms to the above format for the " +
    provider +
    " service " +
    service +
    ", including service, description (12 words or less), " +
    "detail, benefits (an array of strings), cons (an array of strings), " +
    "useCases (an array of strings), link (a string in URI format), " +
    "example (a string), and type ( a string with the value " +
    serviceType +
    "). Make each benefit and con 30 words or greater.";
  const model = "gpt-3.5-turbo";
  const role = "user";

  const completion = await openai.createChatCompletion({
    model: model,
    messages: [{role: role, content: content}],
  });

  const response = completion.data.choices[0].message.content;
  console.log("🚀 ~ file: index.ts:788 ~ serviceDataGenerator:", response);

  try {
    saveServiceDataToFirestore(response, service, provider);
  } catch (error) {
    console.log("🚀 ~ file: index.ts:793 ~serviceDataGenerator~ error:", error);
  }
});

/**
 * Saves a Service to Firestore database.
 * @async
 * @function saveServiceDataToFirestore
 * @param {any} response - The response data to be saved.
 * @param {string} service - The service name.
 * @param {string} provider - The service provide.
 * @throws {Error} - Throws an error if there was a problem saving
 * the data to Firestore.
 * @return {Promise<void>}
 */
async function saveServiceDataToFirestore(response, service, provider) {
  try {
    const serviceData = JSON.parse(response);
    console.log("🚀 ~ saveServiceDataToFirestore: JSON.parse completed");
    await saveServiceDataToFirestoreHelper(serviceData, service, provider);
  } catch (error) {
    console.error("🚨 ~ saveServiceDataToFirestore:", error.message);
    const result = await convertToJSON(response);
    const serviceData = JSON.parse(result);
    console.log("saveServiceDataToFirestore: JSON.parse (fallback) completed");
    await saveServiceDataToFirestoreHelper(serviceData, service, provider);
  }
}
/**
 * Saves a Service to Firestore database.
 * @async
 * @function saveServiceDataToFirestoreHelper
 * @param {any} serviceData - The response data to be saved.
 * @param {string} service - The service name.
 * @param {string} provider - The service provide.
 * @throws {Error} - Throws an error if there was a problem saving
 * the data to Firestore.
 * @return {Promise<void>}
 */
async function saveServiceDataToFirestoreHelper(
  serviceData,
  service,
  provider
) {
  const serviceName = removeCloudAndWhitespace(serviceData.service);
  await firestore().collection("services").doc(serviceName).set({
    benefits: serviceData.benefits,
    cons: serviceData.cons,
    description: serviceData.description,
    detail: serviceData.detail,
    example: serviceData.example,
    link: serviceData.link,
    provider: provider,
    service: serviceData.service,
    type: serviceData.type,
    useCases: serviceData.useCases,
    lastUpdated: FieldValue.serverTimestamp(),
  });
  console.log("🚀 ~ saveServiceDataToFirestore: completed");
}

// Check if UID is Admin UID
export const checkUserId = functions.https.onCall(async (data, context) => {
  try {
    // Check if the request is authenticated
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Unable to perform action."
      );
    }

    // Get the UID of the authenticated user
    const authenticatedUid = context.auth.uid;

    // Get the UID from secrets
    const adminUID = await getSecretsClient("adminUID");

    // Compare the authenticated UID with the UID to check
    if (authenticatedUid === adminUID) {
      // Return a success message if the UIDs match
      return true;
    } else {
      // Return an error if the UIDs do not match
      throw new functions.https.HttpsError(
        "permission-denied",
        "User ID does not match."
      );
    }
  } catch (error) {
    console.log("🚀 ~ file: index.ts:825 ~ checkUserId ~ error:", error);
    // Catch any errors and throw as a Firebase Cloud Functions error
    throw new functions.https.HttpsError("internal", error.message, error);
  }
});

// Function to update service document
exports.updateServiceField = functions.https.onCall(async (snap, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }

  const openai = await getOpenaiClient();

  const service = snap.service;
  const docID = removeCloudAndWhitespace(snap.service);
  const field = snap.field;
  console.log("🚀 ~ field:", typeof field);
  const provider = snap.provider;
  let content = "";

  const model = "gpt-3.5-turbo";
  const role = "user";

  const arrayDescription =
    "This should be in an array of strings, with each " +
    "string containing at least 30 words. Please ensure that " +
    "the response is valid JSON and that the array is an array " +
    "of strings, not an array of objects or maps.";

  // const arrayDescription2 =
  //   "This should be in an array of non-numbered strings. " +
  //   "Please ensure that the response is valid JSON and " +
  //   "that the array is an array of strings, not an " +
  //   "array of objects or maps.";

  switch (field) {
  case "description":
    content =
        "Generate information that conforms to the json " +
        `format {description: ""} for the ${provider} service ${service}.` +
        "Make the description 12 words or less.";
    break;
  case "detail":
    content =
        "Generate a detailed explanation that conforms to the " +
        `json format {detail: ""} for the ${provider} service ${service}.`;
    break;
  case "benefits":
    content =
        `Generate benefits for the ${provider} service ${service} ` +
        `that conform to the JSON format {benefits: []}. ${arrayDescription}`;
    break;
  case "cons":
    content =
        `Generate cons for the ${provider} service ${service} ` +
        `that conform to the JSON format {cons: []}. ${arrayDescription}`;
    break;
  case "useCases":
    content =
        `Generate use cases for the ${provider} service ${service} ` +
        `that conform to the JSON format {useCases: []}. ${arrayDescription}`;
    break;
  default:
    console.log("🚀 ~ updateServiceField: Did not make api call.");
    return;
  }

  console.log(content);
  const completion = await openai.createChatCompletion({
    model: model,
    messages: [{role: role, content: content}],
    temperature: 0.5,
  });

  const response = completion.data.choices[0].message.content;

  try {
    updateFirestoreDocumentField(response, docID, field);
  } catch (error) {
    console.log("🚀 ~ index.ts:932 ~ exports.updateServiceField:", error);
  }
});

/**

Update firestore document fields.
@async
@function updateFirestoreDocumentField
@param {any} response - The response data to be saved.
@param {string} docID - The document ID.
@param {string} field - The document field to be updated.
@throws {Error} - Throws an error if there was a problem saving
the data to Firestore.
@return {Promise<void>}
*/
async function updateFirestoreDocumentField(
  response: any,
  docID: string,
  field: string
) {
  try {
    const serviceData = JSON.parse(response);
    const updateData = {};

    if (field === "description") {
      updateData["description"] = serviceData.description;
    } else if (field === "detail") {
      updateData["detail"] = serviceData.detail;
    } else if (field === "benefits") {
      updateData["benefits"] = serviceData.benefits;
    } else if (field === "cons") {
      updateData["cons"] = serviceData.cons;
    } else if (field === "useCases") {
      updateData["useCases"] = serviceData.useCases;
    }

    updateData["lastUpdated"] = FieldValue.serverTimestamp();

    await firestore().collection("services").doc(docID).update(updateData);
  } catch (error) {
    console.log("🚀 ~index.ts:969 ~ updateFirestoreDocumentField:", error);
    try {
      const result = await convertToJSON(response);
      const serviceData = JSON.parse(result);
      const updateData = {};

      if (field === "description") {
        updateData["description"] = serviceData.description;
      } else if (field === "detail") {
        updateData["detail"] = serviceData.detail;
      } else if (field === "benefits") {
        updateData["benefits"] = serviceData.benefits;
      } else if (field === "cons") {
        updateData["cons"] = serviceData.cons;
      } else if (field === "useCases") {
        const cleanData = removeLeadingNumbers(serviceData.useCases);
        updateData["useCases"] = cleanData;
      }

      updateData["lastUpdated"] = FieldValue.serverTimestamp();

      await firestore().collection("services").doc(docID).update(updateData);
    } catch (error) {
      console.error("🚨 ~ updateFirestoreDocumentField:", error);
      await firestore().collection("failedToSave").doc().set({
        data: response.toString(),
        timestamp: FieldValue.serverTimestamp(),
      });
    }
  }
}

/**
 * Removes any leading numbers and spaces from each string in an array.
 *
 * @function removeLeadingNumbers
 * @param {string[]} arr The input array of strings.
 * @return {string[]} An array of strings with leading numbers removed.
 */
function removeLeadingNumbers(arr: string[]): string[] {
  const output: string[] = [];
  for (let i = 0; i < arr.length; i++) {
    const regex = /^\d+\s*/; // Matches any leading digits and spaces
    // Removes any leading digits and spaces
    output.push(arr[i].replace(regex, ""));
  }
  return output;
}

exports.checkServices = functions.https.onCall(async (snap, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action."
    );
  }
  const servicesRef = firestore().collection("services");
  const servicesSnap = await servicesRef.get();

  try {
    servicesSnap.forEach((doc) => {
      const serviceData = doc.data();
      const missingFields = [];

      if (!serviceData.service) {
        missingFields.push("service");
      }
      if (!serviceData.description) {
        missingFields.push("description");
      }
      if (!serviceData.detail) {
        missingFields.push("detail");
      }
      if (!serviceData.link) {
        missingFields.push("link");
      }
      if (!serviceData.provider) {
        missingFields.push("provider");
      }
      if (!serviceData.type) {
        missingFields.push("type");
      }
      if (!serviceData.benefits || !Array.isArray(serviceData.benefits)) {
        missingFields.push("benefits");
      }
      if (!serviceData.cons || !Array.isArray(serviceData.cons)) {
        missingFields.push("cons");
      }
      if (!serviceData.useCases || !Array.isArray(serviceData.useCases)) {
        missingFields.push("useCases");
      }
      if (!serviceData.example) {
        missingFields.push("example");
      }

      if (missingFields.length > 0) {
        console.error(
          `Document ${
            doc.id
          } is missing the following fields: ${missingFields.join(", ")}`
        );
      }
    });
  } catch (error) {
    console.log("🚀 ~ file: index.ts:1087 ~ checkServices~ error:", error);
  }
});

exports.createPopularServicesDocument = functions.firestore
  .document("services/{serviceId}")
  .onCreate(async (snapshot, context) => {
    const serviceId = context.params.serviceId;
    try {
      const popularServicesRef = firestore()
        .collection("popularServices")
        .doc(serviceId);

      await popularServicesRef.set({
        popularity: 0,
        lastUpdated: FieldValue.serverTimestamp(),
        docID: serviceId,
      });

      console.log(`Created popular service document with ID: ${serviceId}`);
    } catch (error) {
      console.error(`Error creating popular service document: ${error}`);
    }
  });

// Delete user document
// npm run lint -- --fix
// <<<<<<< HEAD
// 1a65d409c7a1438a34d21b60bf30a6fd5db59314
// =======
// 90fa3ae28fe6ddaee1af2c120f01e50201c1401b
// >>>>>>> 9cd3d0d9ff05768afa249e036acc66e8abe93bff
