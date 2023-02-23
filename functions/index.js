const functions = require("firebase-functions");
const {axios} = require("axios");
const admin = require("firebase-admin");

admin.initializeApp();

// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started
//
exports.createQuickFacts = functions.https.onRequest((request, response) => {
  const url = "https://api.openai.com/v1/completions";
  const model = "text-davinci-003";
  const prompt = "Name 3 constellations";
  const data = {
    model: model,
    prompt: prompt,
    max_tokens: 300,
    temperature: 0.7,
  };
  axios
      .request({
        headers: "Authorization: Bearer YOUR_API_KEY",
        method: "POST",
        url: url,
        data: data,
      })
      .then((response) => {
        console.log(response.data["choices"]["text"]);
      });
  // const promptStart = "In json format with keys listed as" +
  // "['fact', 'service'] write 5 facts related to ";
  // const promptEnd = "cloud service.";

  // const prompt = promptStart + promptEnd;
  // const newPromptEnd = request.body.prompt;
  // if (newPromptEnd === null || newPromptEnd === undefined) {
  //   console.log(prompt);
  //   response.status(200).send({""});
  // } else {
  //   console.log(promptStart + newPromptEnd);
  //   response.status(200).send((promptStart + newPromptEnd).toString());
  // }
});
exports.newQuickFacts = functions.https.onCall((data, context) => {
  functions.logger.info("newQuickFacts", {structuredData: true});
  const promptStart =
    "In json format with keys listed as" +
    "['fact', 'service'] write 5 facts related to ";
  const promptEnd = "cloud service.";

  const prompt = promptStart + promptEnd;
  const newPromptEnd = context.prompt;
  if (newPromptEnd === null || newPromptEnd === undefined) {
    console.log(prompt);
    return {prompt: prompt};
  } else {
    console.log(promptStart + newPromptEnd);
    return {prompt: prompt};
  }
});

exports.retrieveQuickFacts = functions.https.onCall((data, context) => {
  // if (!context.auth) {
  //   throw new functions.https.HttpsError(
  //       "unauthenticated",
  //       "Unable to perform action."
  //   );
  // }

  const makeGetRequest = async () => {
    try {
      const response = await axios.get("https://storage.googleapis.com/api-project-371618.appspot.com/facts.json");
      // return response.data;
      console.log("Got here");
      console.log(response.data);
      return response.data;
    } catch (err) {
      console.error(err);
    }
  };
  makeGetRequest;
});
