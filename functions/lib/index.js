"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const secret_manager_1 = require("@google-cloud/secret-manager");
const functions = __importStar(require("firebase-functions"));
const axios_1 = __importDefault(require("axios"));
const app_1 = require("firebase-admin/app");
const firebase_admin_1 = require("firebase-admin");
(0, app_1.initializeApp)();
const db = (0, firebase_admin_1.firestore)();
//  Combined data api call.
exports.getCombinedData = functions.https.onCall(async (data, context) => {
    const url = "https://storage.googleapis.com/api-project-371618.appspot.com/combined_data.json";
    try {
        const response = await axios_1.default.get(url);
        if (response.status === 200) {
            return JSON.stringify(response.data);
        }
        else {
            return response.status;
        }
    }
    catch (error) {
        console.error(`Error in combined cloud data API call: ${error}`);
        return "Error in combined cloud data API call";
    }
});
//  Cloud data api call.
exports.getCloudData = functions.https.onCall(async (data, context) => {
    const url = "https://storage.googleapis.com/api-project-371618.appspot.com/cloud_data.json";
    try {
        const response = await axios_1.default.get(url);
        if (response.status === 200) {
            return JSON.stringify(response.data);
        }
        else {
            return response.status;
        }
    }
    catch (error) {
        console.error(`Error in cloud data API call: ${error}`);
        return "Error in cloud data API call";
    }
});
//    Networking data api call.
exports.getNetworkingData = functions.https.onCall(async (data, context) => {
    const url = "https://storage.googleapis.com/api-project-371618.appspot.com/cloud_networking.json";
    try {
        const response = await axios_1.default.get(url);
        if (response.status === 200) {
            return JSON.stringify(response.data);
        }
        else {
            return response.status;
        }
    }
    catch (error) {
        console.error(`Error in cloud networking data API call: ${error}`);
        return "Error in cloud networking data API call";
    }
});
//    Database data api call.
exports.getDatabaseData = functions.https.onCall(async (data, context) => {
    const url = "https://storage.googleapis.com/api-project-371618.appspot.com/database_data.json";
    try {
        const response = await axios_1.default.get(url);
        if (response.status === 200) {
            return JSON.stringify(response.data);
        }
        else {
            return response.status;
        }
    }
    catch (error) {
        console.error(`Error in cloud database data API call: ${error}`);
        return "Error in cloud database data API call";
    }
});
//    Security data api call.
exports.getSecurityData = functions.https.onCall(async (data, context) => {
    const url = "https://storage.googleapis.com/api-project-371618.appspot.com/security_data.json";
    try {
        const response = await axios_1.default.get(url);
        if (response.status === 200) {
            return JSON.stringify(response.data);
        }
        else {
            return response.status;
        }
    }
    catch (error) {
        console.error(`Error in cloud security data API call: ${error}`);
        return "Error in cloud security data API call";
    }
});
//    Gcloud command line data api call.
exports.getGCloudData = functions.https.onCall(async (data, context) => {
    const url = "https://storage.googleapis.com/api-project-371618.appspot.com/cmd_line_cheat_sheet.json";
    try {
        const response = await axios_1.default.get(url);
        if (response.status === 200) {
            return JSON.stringify(response.data);
        }
        else {
            return response.status;
        }
    }
    catch (error) {
        console.error(`Error in gcloud data API call: ${error}`);
        return "Error in gcloud data API call";
    }
});
//    Facts api call.
exports.getFactsData = functions.https.onCall(async (data, context) => {
    const url = "https://storage.googleapis.com/api-project-371618.appspot.com/facts.json";
    try {
        const response = await axios_1.default.get(url);
        if (response.status === 200) {
            return JSON.stringify(response.data);
        }
        else {
            return response.status;
        }
    }
    catch (error) {
        console.error(`Error in facts data API call: ${error}`);
        return "Error in facts data API call";
    }
});
//  Create new fun facts
exports.createFacts = functions.https.onCall(async (snap, context) => {
    const service = snap.service;
    const prompt = "Tell me 3 interesting facts " +
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
    const uri = "https://api.openai.com/v1/completions";
    const data = {
        model: "text-davinci-003",
        prompt: prompt,
        max_tokens: tokenSize,
        temperature: temp,
    };
    try {
        // Set up Secret Manager client
        const projectId = "247644706560";
        const client = new secret_manager_1.SecretManagerServiceClient();
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
        console.log(data);
        const response = await axios_1.default.post(uri, data, config);
        const result = response.data.choices[0].text.trim();
        console.log("🚀 ~ result:", result);
        try {
            const newResult = JSON.parse(result);
            saveChatGPTResponse(newResult, service);
        }
        catch (e) {
            console.log("🚀 ~ file: index.js:217 ~ error parsing result:", e);
            try {
                const newArray = extractFunFacts(result);
                saveChatGPTResponse(newArray, service);
            }
            catch (error) {
                console.log("🚀 ~ file: index.js:222 ~ error:", error);
            }
        }
    }
    catch (err) {
        console.log("🚀 ~ file: index.js:226 ~ err:", err);
        console.error(err);
    }
});
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
                timestamp: firebase_admin_1.firestore.FieldValue.serverTimestamp(),
            });
        });
        console.log("🚀 ~ file: index.ts:207 ~ documents ~ documents:", documents);
    }
    catch (err) {
        console.log("🚀 ~ file: index.js:254 ~ saveChatGPTResponse ~ err:", err);
    }
}
/**

Extracts fun facts from a string containing JSON objects surrounded by square
 brackets.
@param {string} str - The input string containing fun facts in JSON format.
@return {Array} An array of fun fact objects extracted from the input string,
or an empty array if no matches were found.
@throws {SyntaxError} If the fun facts are not in valid JSON format.
@example
const input = "[{'fun_fact': 'The Great Wall of China is not visible from
space.'}, {'fun_fact': 'The first oranges weren’t orange.'}]";
const funFacts = extractFunFacts(input);
console.log(funFacts);
// Output: [{fun_fact: "The Great Wall of China is not visible from space."},
{fun_fact: "The first oranges weren’t orange."}]
**/
function extractFunFacts(str) {
    const regex = /\[(.*?)\]/g;
    const matches = str.match(regex);
    if (!matches) {
        return [];
    }
    return matches.map((match) => {
        const obj = JSON.parse(match.replace(/'/g, '"').replace(/fun_fact/g, '"fun_fact"'));
        return obj;
    });
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
//# sourceMappingURL=index.js.map