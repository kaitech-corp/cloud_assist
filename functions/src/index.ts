/* eslint-disable @typescript-eslint/no-explicit-any */
import {SecretManagerServiceClient} from "@google-cloud/secret-manager";
import {firestore} from "firebase-admin";
import {initializeApp} from "firebase-admin/app";
import {FieldValue} from "firebase-admin/firestore";
import * as functions from "firebase-functions/v1";
import {onDocumentCreated} from "firebase-functions/firestore";
import {HttpsError, onCall} from "firebase-functions/v2/https";
import {SchemaType, VertexAI} from "@google-cloud/vertexai";
import {OpenAI} from "openai";
import axios from "axios";

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
 * @return {Promise<OpenAI>} - The OpenAI client.
 */
async function getOpenaiClient() {
  // Get the organization and OpenAI API key from Google Cloud Secret Manager
  const orgKey = await getSecretsClient("orgKey");
  const secretValue = await getSecretsClient("openAI_api_key");

  // Create a new configuration object with the retrieved keys

  // Create and return a new OpenAI client using the configuration object
  return new OpenAI({organization: orgKey, apiKey: secretValue});
}

//  Create new fun facts
exports.createFacts = onDocumentCreated("services/{doc}", async (event) =>{
  try {
    // Initialize the OpenAI client.
    const openai = await getOpenaiClient();

    // Retrieve the service data from the Firestore document.
    const snapshot = event.data;
    if (!snapshot) {
      console.log("No data associated with the event");
      return;
    }
    const data = snapshot.data();
    const service = data.service;

    // Build a simple prompt since the response format is enforced
    // via the API option.
    const prompt = `Tell me 5 interesting facts about ${service}.`;

    // Call the OpenAI API with the response_format option to enforce
    // the JSON schema.
    const response = await openai.chat.completions.create({
      model: "gpt-4o-mini",
      messages: [
        {role: "system", content: "Cloud Computing Expert"},
        {role: "user", content: prompt},
      ],
      response_format: {
        type: "json_schema",
        json_schema: {
          name: "my_response",
          schema: {
            type: "array",
            items: {
              type: "object",
              properties: {
                fun_fact: {type: "string"},
              },
              required: ["fun_fact"],
            },
            minItems: 5,
            maxItems: 5,
          },
        },
      },
    });

    // Extract the raw result from the API response.
    const resultText = response.choices[0].message.content.trim();
    console.log("🚀 ~ result:", resultText);

    // Optionally, save the plain response for troubleshooting.
    await savePlainResponse(service, resultText);

    // Save the final ChatGPT response.
    await saveChatGPTResponse(resultText, service);
  } catch (error) {
    console.error("Error in createFacts function:", error);
  }
});


//  Manually create new fun facts
exports.createNewFactsManually = onCall(async (request) => {
  if (!request.auth.uid) {
    throw new HttpsError(
      "permission-denied",
      "User is not authenticated.",
    );
  }
  const openai = await getOpenaiClient();
  const service = request.data.service;
  const prompt = `Tell me 5 interesting facts about ${service}.`;
  try {
    // Call the OpenAI API with the updated response_format option.
    const response = await openai.chat.completions.create({
      model: "gpt-4o-mini",
      messages: [
        {role: "system", content: "Cloud Computing Expert"},
        {role: "user", content: prompt},
      ],
      response_format: {
        type: "json_schema",
        json_schema: {
          name: "my_response",
          schema: {
            type: "array",
            items: {
              type: "object",
              properties: {
                fun_fact: {type: "string"},
              },
              required: ["fun_fact"],
            },
            minItems: 5,
            maxItems: 5,
          },
        },
      },
    });


    const result = response.choices[0].message.content.trim();
    console.log("🚀 ~ result:", result);
    // Save plain response for troubleshooting
    savePlainResponse(service, result);
    try {
      saveChatGPTResponse(result, service);
    } catch (error) {
      console.log("🚀 ~ file: index.ts:337 ~ error:", error);
    }
  } catch (error) {
    console.log("🚀 ~ file: index.js:340 ~ error:", error);
  }
},
);

//  Create new fun facts
exports.createNewFacts = onCall(async (request) => {
  if (!request.auth.uid) {
    throw new HttpsError(
      "permission-denied",
      "User is not authenticated.",
    );
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
    const result = response.choices[0].message.content.trim();
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
      error,
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

// exports.fetchAPIData = functions.pubsub
//   .schedule("every sunday 00:00")
//   .onRun(async (context) => {
//     // List all api calls
//     const apiList = [
//       "getCombinedCloudData",
//       "getCloudData",
//       "getNetworkingData",
//       "getDatabaseData",
//       "getSecurityData",
//       "getGCloudData",
//     ];
//     try {
//       apiList.forEach(async (apiName) => {
//         // Update Firestore timestamp
//         const timestamp = firestore.FieldValue.serverTimestamp();
//         await firestore().collection("apiStatus").doc(apiName).update({
//           lastUpdated: timestamp,
//         });
//       });
//     } catch (error) {
//       console.log("🚀 ~ file: index.ts:581 ~ .onRun ~ error:", error);
//     }
//   });

exports.reportGenerator = onCall(async (request) => {
  if (!request.auth.uid) {
    throw new HttpsError(
      "permission-denied",
      "User is not authenticated.",
    );
  }
  const openai = await getOpenaiClient();
  const title = request.data.title.toString();
  const content =
    "Write a 500 word report explaining to a high school student on " + title;
  const model = "gpt-4o-mini";
  const role = "user";

  const completion = await openai.chat.completions.create({
    model: model,
    messages: [{role: role, content: content}],
  });

  const reportResponse = completion.choices[0].message.content;

  try {
    saveReportToFirestore(reportResponse, title);
  } catch (error) {
    console.log("🚀 ~ file: index.ts:611 ~ exports.reportGenerator ~ error:",
      error);
    saveReportToFirestore(reportResponse, title);
  }
});

/**

Saves a report to Firestore database.
@async
@function saveReportToFirestore
@param {string} reportResponse - The report data to be saved.
@param {string} title - The title of the report.
@throws {Error} - Throws an error if there was a problem saving
the report to Firestore.
@return {Promise<void>}
*/
async function saveReportToFirestore(reportResponse: string, title: string) {
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
      error,
    );
  }
}

exports.updateTags = onDocumentCreated("reports/{doc}", async (event) => {
  const openai = await getOpenaiClient();
  const doc = event.params.doc;
  const snapshot = event.data.data();
  const report = snapshot.content;
  const docRef = firestore().collection("reports").doc(doc);

  const content =
      report +
      " Create tags for this report to identify it " +
      "in a search. List them as a json array.";
  const model = "gpt-4o-mini";
  const role = "user";

  try {
    const completion = await openai.chat.completions.create({
      model: model,
      messages: [{role: role, content: content}],
    });
    const tagResponse = completion.choices[0].message.content;
    const tagArray = JSON.parse(tagResponse);
    console.log(
      "🚀 ~ file: index.ts:664 ~ exports.reportGenerator ~ tagResponse:",
      tagArray,
    );
    await docRef.update({
      tags: tagArray,
    });
  } catch (error) {
    console.log(
      "🚀 ~ file: index.ts:673 ~ exports.updateTags ~ error:",
      error,
    );
  }
});

exports.databaseSolutionGenerator = onDocumentCreated(
  "databaseComparison/{docID}", async (event) => {
    const openai = await getOpenaiClient();
    const docID = event.params.docID;
    const docRef = firestore().collection("databaseComparison").doc(docID);
    const snapshot = event.data.data();
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
        "Please provide detailed recommendations for the best database" +
        "service based on the following parameters: " +
        {answerString} +
        "Your response must include the following sections: " +
        "Description: A brief summary of the recommended service. " +
        "Suggestions: List the potential database services that best " +
        "match the parameters. List only suggestions, one per line." +
        "Reasons: Provide detailed reasons for each suggestion." +
        "Comparable Services: Compare offerings from GCP, AWS, Azure, " +
        "and other popular services highlighting key differences." +
        "Format your response as plain text with clear section headings " +
        "and no markdown.";
      const model = "gpt-4o-mini";
      const role = "user";

      const completion = await openai.chat.completions.create({
        model,
        messages: [{role, content}],
      });
      const response = completion.choices[0].message.content;

      try {
        docRef.update({
          answer: response,
          timestamp: firestore.FieldValue.serverTimestamp(),
        });
      } catch (error) {
        console.log(
          "🚀 ~ file: index.ts:717 ~ databaseSolutionGenerator ~ error:",
          error,
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
      error,
    );
  }
});

// Function to create new service document
exports.serviceDataGenerator = onCall(async (request) => {
  if (!request.auth.uid) {
    throw new HttpsError(
      "permission-denied",
      "User is not authenticated.",
    );
  }
  const openai = await getOpenaiClient();
  const service = request.data.service;
  const serviceType = request.data.serviceType;
  const provider = request.data.provider;
  const prompt = `Generate detailed information for the 
  ${provider} service "${service}".
Please include the following in your response:
  - **service**: The service name.
  - **description**: A short description (12 words or less).
  - **detail**: Additional details about the service.
  - **benefits**: An array of benefits (each should be at least 30 words).
  - **cons**: An array of cons (each con should be at least 30 words).
  - **useCases**: An array of use cases.
  - **link**: A link (must be in valid URI format).
  - **example**: An example.
  - **type**: A string that must be "${serviceType}".

Output the result as a JSON object following the pre-defined schema.`;

  const model = "gpt-4o-mini";

  // Call the OpenAI API with the response_format option using
  // the correct json_schema syntax.
  const completion = await openai.chat.completions.create({
    model: model,
    messages: [{role: "user", content: prompt}],
    response_format: {
      type: "json_schema",
      json_schema: {
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
            "service",
            "description",
            "detail",
            "benefits",
            "cons",
            "useCases",
            "link",
            "example",
            "type",
          ],
        },
      },
    },
  });

  const response = completion.choices[0].message.content;
  console.log("🚀 ~ file: index.ts:788 ~ serviceDataGenerator:", response);

  try {
    saveServiceDataToFirestore(response, service, provider);
  } catch (error) {
    console.log("🚀 ~ file: index.ts:793 ~serviceDataGenerator~ error:", error);
  }
});

exports.serviceDataGenerator = onCall(async (request) => {
  if (!request.auth.uid) {
    throw new HttpsError(
      "permission-denied",
      "User is not authenticated.",
    );
  }

  const service = request.data.service;
  const serviceType = request.data.serviceType;
  const provider = request.data.provider;

  if (!service || !serviceType || !provider) {
    throw new HttpsError(
      "invalid-argument",
      "Missing service, serviceType, or provider in the request.",
    );
  }

  const prompt = `Generate detailed information for the
$ service "${service}".
Please include the following in your response:
- **service**: The service name.
- **description**: A short description (12 words or less).
- **detail**: Additional details about the service.
- **benefits**: An array of benefits (each should be at least 30 words).
- **cons**: An array of cons (each con should be at least 30 words).
- **useCases**: An array of use cases.
- **link**: A link (must be in valid URI format).
- **example**: An example.
- **type**: A string that must be "${serviceType}".

Output the result as a JSON object following the pre-defined schema.`;

  const jsonSchema = {
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
      "service",
      "description",
      "detail",
      "benefits",
      "cons",
      "useCases",
      "link",
      "example",
      "type",
    ],
  };


  if (provider === "openai") {
    const openai = await getOpenaiClient(); // Assuming you have this function
    const model = "gpt-4o-mini";

    try {
      const completion = await openai.chat.completions.create({
        model: model,
        messages: [{role: "user", content: prompt}],
        response_format: {
          type: "json_schema",
          json_schema: {
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
                "service",
                "description",
                "detail",
                "benefits",
                "cons",
                "useCases",
                "link",
                "example",
                "type",
              ],
            },
          },
        },
      });

      const responseContent = completion.choices[0].message.content;
      if (!responseContent) {
        throw new HttpsError(
          "unavailable", "OpenAI returned an empty response.");
      }

      try {
        const parsedResponse = JSON.parse(responseContent);
        return parsedResponse;
      } catch (parseError) {
        console.error(
          "Error parsing OpenAI response:", parseError,
          "Response content:", responseContent);
        throw new HttpsError(
          "internal", "Failed to parse OpenAI response as JSON.");
      }
    } catch (error) {
      console.error("Error calling OpenAI:", error);
      throw new HttpsError(
        "unavailable", "Failed to get response from OpenAI: " + error.message);
    }
  } else if (provider === "google") {
    try {
      // Initialize Vertex AI
      const vertexAI = new VertexAI({
        project: process.env.GCLOUD_PROJECT,
        location: "us-central1", // Or your desired location
      });

      const model = vertexAI.getGenerativeModel({
        model: "gemini-1.5-pro-005",
        generationConfig: {
          responseMimeType: "application/json",
          responseSchema: jsonSchema,
        },
      });


      // Call Vertex AI Gemini API

      const response = await model.generateContent(prompt);

      const content = response.response.candidates[0].content;

      if (!content || !content.parts || content.parts.length === 0) {
        throw new HttpsError(
          "unavailable", "Vertex AI returned an empty content.");
      }
      const text = content.parts[0].text;

      if (!text) {
        throw new HttpsError("unavailable",
          "Vertex AI returned an empty text.");
      }
      try {
        const parsedResponse = JSON.parse(text);
        return parsedResponse;
      } catch (parseError) {
        console.error("Error parsing Vertex AI response:",
          parseError, "Response content:", text);
        throw new HttpsError(
          "internal", "Failed to parse Vertex AI response as JSON.");
      }
    } catch (error) {
      console.error("Error calling Vertex AI:", error);
      throw new HttpsError("unavailable",
        "Failed to get response from Vertex AI: " + error.message);
    }
  } else {
    throw new HttpsError(
      "invalid-argument",
      "Invalid provider.  Must be 'openai' or 'google'.",
    );
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
  provider,
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
export const checkUserId = onCall(async (request) => {
  try {
    // Get the UID of the authenticated user
    const authenticatedUid = request.auth.uid;

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
        "User ID does not match.",
      );
    }
  } catch (error) {
    console.log("🚀 ~ file: index.ts:825 ~ checkUserId ~ error:", error);
    // Catch any errors and throw as a Firebase Cloud Functions error
    throw new HttpsError("internal", error.message, error);
  }
});

// Function to update service document
exports.updateServiceField = onCall(async (request) => {
  if (!request.auth.uid) {
    throw new HttpsError(
      "permission-denied",
      "User is not authenticated.",
    );
  }

  const openai = await getOpenaiClient();

  const service = request.data.service;
  const docID = removeCloudAndWhitespace(request.data.service);
  const field = request.data.field;
  console.log("🚀 ~ field:", typeof field);
  const provider = request.data.provider;
  let content = "";

  const model = "gpt-4o-mini";
  const role = "user";

  const arrayDescription =
  "Each item in the array must be a string with at least 30 words.";

  const responseFormat: {
    type: "json_schema";
    json_schema: {
      name: string;
      schema: {
        type: "object";
        properties: Record<string, any>;
        required: string[];
      };
    };
  } = {
    type: "json_schema",
    json_schema: {
      name: "service_data_response",
      schema: {
        type: "object",
        properties: {},
        required: [],
      },
    },
  };

  switch (field) {
  case "description":
    content = `Generate a concise description (12 words or less) 
    for the ${provider} service ${service}.`;
    responseFormat.json_schema.schema.properties = {
      description: {type: "string"},
    };
    responseFormat.json_schema.schema.required = ["description"];
    break;

  case "detail":
    content = `Provide a detailed explanation for the 
    ${provider} service ${service}.`;
    responseFormat.json_schema.schema.properties = {
      detail: {type: "string"},
    };
    responseFormat.json_schema.schema.required = ["detail"];
    break;

  case "benefits":
    content = `List benefits of the ${provider} 
    service ${service}. ${arrayDescription}`;
    responseFormat.json_schema.schema.properties = {
      benefits: {
        type: "array",
        items: {type: "string"}, // Ensures each benefit has at least 30 words
      },
    };
    responseFormat.json_schema.schema.required = ["benefits"];
    break;

  case "cons":
    content = `List cons of the ${provider} 
    service ${service}. ${arrayDescription}`;
    responseFormat.json_schema.schema.properties = {
      cons: {
        type: "array",
        items: {type: "string"},
      },
    };
    responseFormat.json_schema.schema.required = ["cons"];
    break;

  case "useCases":
    content = `List use cases of the ${provider} 
    service ${service}. ${arrayDescription}`;
    responseFormat.json_schema.schema.properties = {
      useCases: {
        type: "array",
        items: {type: "string"},
      },
    };
    responseFormat.json_schema.schema.required = ["useCases"];
    break;

  default:
    console.log("🚀 ~ updateServiceField: Did not make API call.");
    return;
  }

  console.log(content);

  const completion = await openai.chat.completions.create({
    model: model,
    messages: [{role: role, content: content}],
    response_format: responseFormat,
  });


  const response = completion.choices[0].message.content;

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
@param {string} response - The response data to be saved.
@param {string} docID - The document ID.
@param {string} field - The document field to be updated.
@throws {Error} - Throws an error if there was a problem saving
the data to Firestore.
@return {Promise<void>}
*/
async function updateFirestoreDocumentField(
  response: string,
  docID: string,
  field: string,
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

exports.checkServices = onCall(async (request) => {
  if (!request.auth.uid) {
    throw new HttpsError(
      "permission-denied",
      "User is not authenticated.",
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
          } is missing the following fields: ${missingFields.join(", ")}`,
        );
      }
    });
  } catch (error) {
    console.log("🚀 ~ file: index.ts:1087 ~ checkServices~ error:", error);
  }
});

exports.createPopularServicesDocument = onDocumentCreated(
  "services/{serviceId}", async (event) => {
    const serviceId = event.params.serviceId;
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

// Update interaction collection with last updated timestamp
exports.lastInteractionTimestamp = onDocumentCreated(
  "userInteraction/{uid}/interactions/{doc}", async (event) => {
    const uid = event.params.uid;
    try {
      const popularServicesRef = firestore()
        .collection("userInteraction")
        .doc(uid);

      await popularServicesRef.update({
        lastUpdated: FieldValue.serverTimestamp(),
      });

      console.log("Updated user interaction document");
    } catch (error) {
      console.error(`Error updating user interaction document: ${error}`);
    }
  });


//  Combined data api call.
exports.getCombinedData = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action.",
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
      "Unable to perform action.",
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
      "Unable to perform action.",
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
exports.getDatabaseData = onCall(async (request) => {
  if (!request.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action.",
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
exports.getSecurityData = onCall(async (request) => {
  if (!request.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action.",
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
exports.getGCloudData = onCall(async (request) => {
  if (!request.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action.",
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

// Get Database Comparison Questions
exports.getDatabaseComparisonQuestions = onCall(async (request) => {
  if (!request.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action.",
    );
  }
  const url =
    "https://storage.googleapis.com/api-project-371618.appspot.com/database_comparison_questions.json";

  try {
    const response = await axios.get(url);
    if (response.status === 200) {
      return JSON.stringify(response.data);
    } else {
      return response.status;
    }
  } catch (error) {
    console.log(
      "🚀 ~ file: index.ts:214 ~ getDatabaseComparisonQuestions ~ error:",
      error,
    );
    return "Error in database comparison questions API call";
  }
});

// Get Facts Data
exports.getFactsData = onCall(async (request) => {
  if (!request.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Unable to perform action.",
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
    console.log("🚀 ~ file: index.ts:238 ~ getFactsData ~ error:", error);
    return "Error in facts data API call";
  }
});

// Delete user document
// npm run lint -- --fix
