import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../models/gcloud_data_model/gcloud_data_model.dart';

class CloudFunctions {
  // Create new quick facts
  Future<void> newQuickFacts() async {
    try {
      final HttpsCallable newQuickFacts =
          FirebaseFunctions.instance.httpsCallable('newQuickFacts');
      newQuickFacts(<String, dynamic>{
        'prompt': 'GCP Anthos',
      });
      final HttpsCallableResult<dynamic> result = await newQuickFacts.call();
      if (kDebugMode) {
        // ignore: avoid_dynamic_calls
        print(result.data['prompt']);
      }
    } on FirebaseFunctionsException catch (error) {
      if (kDebugMode) {
        print(error.code);
        print(error.details);
        print(error.message);
      }
    }
  }

  // Retrieve quick facts
  Future<void> retrieveQuickFacts() async {
    try {
      final HttpsCallable retrieveQuickFacts =
          FirebaseFunctions.instance.httpsCallable('retrieveQuickFacts');
      // retrieveQuickFacts(<String, dynamic>{
      //   'prompt': 'GCP Anthos',
      // });
      final HttpsCallableResult<dynamic> result =
          await retrieveQuickFacts.call();
      if (kDebugMode) {
        print(result.data);
      }
    } on FirebaseFunctionsException catch (error) {
      if (kDebugMode) {
        print(error.code);
        print(error.details);
        print(error.message);
      }
    }
  }

Future<List<CloudData>> getCombinedCloudData() async {
  try {
    // Call the Firebase Functions HTTP endpoint 'getCombinedData'
    final HttpsCallableResult<dynamic> callable = await FirebaseFunctions.instance.httpsCallable('getCombinedData').call();

    // Parse the JSON response from the callable as a List of Maps
    final List<dynamic> response = json.decode(callable.data as String) as List<dynamic>;
    final List<Map<String, dynamic>> result = List.castFrom(response);

    // Convert the List of Maps to a List of CloudData objects using CloudData.fromJson()
    final List<CloudData> cloudData = result.map((Map<String, dynamic> item) => CloudData.fromJson(item)).toList();

    // Return the List of CloudData objects
    return cloudData;
  } catch (e, stackTrace) {
    // Print an error message and return an empty List if an error occurs
    if (kDebugMode) {
      print('Error in getCombinedCloudData: $e, $stackTrace');
    }
    return <CloudData>[];
  }
}

Future<List<CloudData>> getCloudData() async {
  try {
    // Call the Firebase Functions HTTP endpoint 'getCloudData'
    final HttpsCallableResult<dynamic> callable = await FirebaseFunctions.instance.httpsCallable('getCloudData').call();

    // Parse the JSON response from the callable as a List of Maps
    final List<dynamic> response = json.decode(callable.data as String) as List<dynamic>;
    final List<Map<String, dynamic>> result = List.castFrom(response);

    // Convert the List of Maps to a List of CloudData objects using CloudData.fromJson()
    final List<CloudData> cloudData = result.map((Map<String, dynamic> item) => CloudData.fromJson(item)).toList();

    // Return the List of CloudData objects
    return cloudData;
  } catch (e, stackTrace) {
    // Print an error message and return an empty List if an error occurs
    if (kDebugMode) {
      print('Error in getCombinedCloudData: $e, $stackTrace');
    }
    return <CloudData>[];
  }
}
Future<List<CloudData>> getNetworkingData() async {
  try {
    // Call the Firebase Functions HTTP endpoint 'getNetworkingData'
    final HttpsCallableResult<dynamic> callable = await FirebaseFunctions.instance.httpsCallable('getNetworkingData').call();

    // Parse the JSON response from the callable as a List of Maps
    final List<dynamic> response = json.decode(callable.data as String) as List<dynamic>;
    final List<Map<String, dynamic>> result = List.castFrom(response);

    // Convert the List of Maps to a List of CloudData objects using CloudData.fromJson()
    final List<CloudData> cloudData = result.map((Map<String, dynamic> item) => CloudData.fromJson(item)).toList();

    // Return the List of CloudData objects
    return cloudData;
  } catch (e, stackTrace) {
    // Print an error message and return an empty List if an error occurs
    if (kDebugMode) {
      print('Error in getCombinedCloudData: $e, $stackTrace');
    }
    return <CloudData>[];
  }
}

Future<List<CloudData>> getDatabaseData() async {
  try {
    // Call the Firebase Functions HTTP endpoint 'getDatabaseData'
    final HttpsCallableResult<dynamic> callable = await FirebaseFunctions.instance.httpsCallable('getDatabaseData').call();

    // Parse the JSON response from the callable as a List of Maps
    final List<dynamic> response = json.decode(callable.data as String) as List<dynamic>;
    final List<Map<String, dynamic>> result = List.castFrom(response);

    // Convert the List of Maps to a List of CloudData objects using CloudData.fromJson()
    final List<CloudData> cloudData = result.map((Map<String, dynamic> item) => CloudData.fromJson(item)).toList();

    // Return the List of CloudData objects
    return cloudData;
  } catch (e, stackTrace) {
    // Print an error message and return an empty List if an error occurs
    if (kDebugMode) {
      print('Error in getCombinedCloudData: $e, $stackTrace');
    }
    return <CloudData>[];
  }
}

Future<List<CloudData>> getSecurityData() async {
  try {
    // Call the Firebase Functions HTTP endpoint 'getSecurityData'
    final HttpsCallableResult<dynamic> callable = await FirebaseFunctions.instance.httpsCallable('getSecurityData').call();

    // Parse the JSON response from the callable as a List of Maps
    final List<dynamic> response = json.decode(callable.data as String) as List<dynamic>;
    final List<Map<String, dynamic>> result = List.castFrom(response);

    // Convert the List of Maps to a List of CloudData objects using CloudData.fromJson()
    final List<CloudData> cloudData = result.map((Map<String, dynamic> item) => CloudData.fromJson(item)).toList();

    // Return the List of CloudData objects
    return cloudData;
  } catch (e, stackTrace) {
    // Print an error message and return an empty List if an error occurs
    if (kDebugMode) {
      print('Error in getCombinedCloudData: $e, $stackTrace');
    }
    return <CloudData>[];
  }
}

Future<List<GCloudData>> getGCloudData() async {
  try {
    // Call the Firebase Functions HTTP endpoint 'getGCloudData'
    final HttpsCallableResult<dynamic> callable = await FirebaseFunctions.instance.httpsCallable('getGCloudData').call();

    // Parse the JSON response from the callable as a List of Maps
    final List<dynamic> response = json.decode(callable.data as String) as List<dynamic>;
    final List<Map<String, dynamic>> result = List.castFrom(response);

    // Convert the List of Maps to a List of GCloudData objects using GCloudData.fromJson()
    final List<GCloudData> gcloudData = result.map((Map<String, dynamic> item) => GCloudData.fromJson(item)).toList();

    // Return the List of GCloudData objects
    return gcloudData;
  } catch (e, stackTrace) {
    // Print an error message and return an empty List if an error occurs
    if (kDebugMode) {
      print('Error in getCombinedCloudData: $e, $stackTrace');
    }
    return <GCloudData>[];
  }
}

Future<List<String>> getFactsData() async {
  try {
    // Call the Firebase Functions HTTP endpoint 'getFactsData'
    final HttpsCallableResult<dynamic> callable = await FirebaseFunctions.instance.httpsCallable('getFactsData').call();

    // Parse the JSON response from the callable as a List of Maps
    final List<dynamic> response = json.decode(callable.data as String) as List<dynamic>;
    final List<Map<String, dynamic>> result = List.castFrom(response);

    // Convert the List of Maps to a List of QuickFact objects using QuickFact.fromJson()
    final List<String> facts = result.map((Map<String, dynamic> item) => item['fact'] as String).toList();

    // Return the List of QuickFact objects
    return facts;
  } catch (e, stackTrace) {
    // Print an error message and return an empty List if an error occurs
    if (kDebugMode) {
      print('Error in getCombinedCloudData: $e, $stackTrace');
    }
    return <String>[];
  }
}

}
