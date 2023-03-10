import {https} from "firebase-functions";
import axios from "axios";
import {initializeApp} from "firebase-admin/app";
initializeApp();

//  Combined data api call.
exports.getCombinedData = https.onCall(async (data, context) => {
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
exports.getCloudData = https.onCall(async (data, context) => {
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
exports.getNetworkingData = https.onCall(async (data, context) => {
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
exports.getDatabaseData = https.onCall(async (data, context) => {
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
exports.getSecurityData = https.onCall(async (data, context) => {
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
exports.getGCloudData = https.onCall(async (data, context) => {
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
exports.getFactsData = https.onCall(async (data, context) => {
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
