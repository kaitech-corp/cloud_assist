import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../models/database_architecture_model/database_architecture_model.dart';
import '../../models/gcloud_data_model/gcloud_data_model.dart';
import '../../models/service_model/create_service_model.dart';
import 'firebase_functions.dart';

class CloudFunctions {
  // Create new quick facts
  Future<void> createFacts(String service) async {
    try {
      final HttpsCallable newQuickFacts =
          FirebaseFunctions.instance.httpsCallable('createFacts');
      newQuickFacts(<String, dynamic>{
        'service': service,
      });
      await newQuickFacts.call();
    } on FirebaseFunctionsException catch (error) {
      if (kDebugMode) {
        print(error.code);
        print(error.details);
        print(error.message);
      }
    }
  }

  // Create new quick facts manually
  Future<void> createNewFactsManually(String service) async {
    try {
      final HttpsCallable newQuickFacts =
          FirebaseFunctions.instance.httpsCallable('createNewFactsManually');
      newQuickFacts(<String, dynamic>{
        'service': service,
      });
      await newQuickFacts.call();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  // Check if Admin
  Future<void> checkUserId() async {
    try {
      final HttpsCallableResult<dynamic> checkUserId =
          await FirebaseFunctions.instance.httpsCallable('checkUserId').call();
      final dynamic result = checkUserId.data;
      return result;
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
      final HttpsCallableResult<dynamic> callable = await FirebaseFunctions
          .instance
          .httpsCallable('getCombinedData')
          .call();

      // Parse the JSON response from the callable as a List of Maps
      final List<dynamic> response =
          json.decode(callable.data as String) as List<dynamic>;
      final List<Map<String, dynamic>> result = List.castFrom(response);

      // Convert the List of Maps to a List of CloudData objects using CloudData.fromJson()
      final List<CloudData> cloudData = result
          .map((Map<String, dynamic> item) => CloudData.fromJson(item))
          .toList();
      // Save to shared preferences
      try {
        const String api = 'getCombinedData';
        FirestoreDatabase().saveAPIData(api, cloudData);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }

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

//
  Future<List<ServiceModel>> getGcpServiceList() async {
    try {
      // Call the Firebase Functions HTTP endpoint 'getGcpServiceList'
      final HttpsCallableResult<dynamic> callable = await FirebaseFunctions
          .instance
          .httpsCallable('getGcpServiceList')
          .call();

      // Parse the JSON response from the callable as a List of Maps
      final List<dynamic> response =
          json.decode(callable.data as String) as List<dynamic>;
      // Convert the List of Maps to a List of ServiceModel objects using ServiceModel.fromJson()
      final List<ServiceModel> serviceModelList = response
          .map((item) => ServiceModel.fromJson(item as Map<String, dynamic>))
          .toList();

      // Return the List of ServiceModel objects
      return serviceModelList;
    } catch (e, stackTrace) {
      // Print an error message and return an empty List if an error occurs
      if (kDebugMode) {
        print('Error in getGcpServiceList: $e, $stackTrace');
      }
      return <ServiceModel>[];
    }
  }

  Future<List<ServiceModel>> getAWSServiceList() async {
    try {
      // Call the Firebase Functions HTTP endpoint 'getGcpServiceList'
      final http.Response callable = await http.get(Uri.parse(
          'https://storage.googleapis.com/api-project-371618.appspot.com/aws_service_list.json'));

      // Parse the JSON response from the callable as a List of Maps
      final List<dynamic> response =
          json.decode(callable.body) as List<dynamic>;
      // Convert the List of Maps to a List of ServiceModel objects using ServiceModel.fromJson()
      final List<ServiceModel> serviceModelList = response
          .map((item) => ServiceModel.fromJson(item as Map<String, dynamic>))
          .toList();

      // Return the List of ServiceModel objects
      return serviceModelList;
    } catch (e, stackTrace) {
      // Print an error message and return an empty List if an error occurs
      if (kDebugMode) {
        print('Error in getAWSServiceList: $e, $stackTrace');
      }
      return <ServiceModel>[];
    }
  }

  Future<List<ServiceModel>> getAzureServiceList() async {
    return <ServiceModel>[];
  }

  Future<List<CloudData>> getCloudData() async {
    try {
      // Call the Firebase Functions HTTP endpoint 'getCloudData'
      final HttpsCallableResult<dynamic> callable =
          await FirebaseFunctions.instance.httpsCallable('getCloudData').call();

      // Parse the JSON response from the callable as a List of Maps
      final List<dynamic> response =
          json.decode(callable.data as String) as List<dynamic>;
      final List<Map<String, dynamic>> result = List.castFrom(response);

      // Convert the List of Maps to a List of CloudData objects using CloudData.fromJson()
      final List<CloudData> cloudData = result
          .map((Map<String, dynamic> item) => CloudData.fromJson(item))
          .toList();

      // Return the List of CloudData objects
      return cloudData;
    } catch (e, stackTrace) {
      // Print an error message and return an empty List if an error occurs
      if (kDebugMode) {
        print('Error in getCloudData: $e, $stackTrace');
      }
      return <CloudData>[];
    }
  }

  Future<List<CloudData>> getNetworkingData() async {
    try {
      // Call the Firebase Functions HTTP endpoint 'getNetworkingData'
      final HttpsCallableResult<dynamic> callable = await FirebaseFunctions
          .instance
          .httpsCallable('getNetworkingData')
          .call();

      // Parse the JSON response from the callable as a List of Maps
      final List<dynamic> response =
          json.decode(callable.data as String) as List<dynamic>;
      final List<Map<String, dynamic>> result = List.castFrom(response);

      // Convert the List of Maps to a List of CloudData objects using CloudData.fromJson()
      final List<CloudData> cloudData = result
          .map((Map<String, dynamic> item) => CloudData.fromJson(item))
          .toList();

      // Return the List of CloudData objects
      return cloudData;
    } catch (e, stackTrace) {
      // Print an error message and return an empty List if an error occurs
      if (kDebugMode) {
        print('Error in getNetworkingData: $e, $stackTrace');
      }
      return <CloudData>[];
    }
  }

  Future<List<CloudData>> getDatabaseData() async {
    try {
      // Call the Firebase Functions HTTP endpoint 'getDatabaseData'
      final HttpsCallableResult<dynamic> callable = await FirebaseFunctions
          .instance
          .httpsCallable('getDatabaseData')
          .call();

      // Parse the JSON response from the callable as a List of Maps
      final List<dynamic> response =
          json.decode(callable.data as String) as List<dynamic>;
      final List<Map<String, dynamic>> result = List.castFrom(response);

      // Convert the List of Maps to a List of CloudData objects using CloudData.fromJson()
      final List<CloudData> cloudData = result
          .map((Map<String, dynamic> item) => CloudData.fromJson(item))
          .toList();

      // Return the List of CloudData objects
      return cloudData;
    } catch (e, stackTrace) {
      // Print an error message and return an empty List if an error occurs
      if (kDebugMode) {
        print('Error in getDatabaseData: $e, $stackTrace');
      }
      return <CloudData>[];
    }
  }

  Future<List<CloudData>> getSecurityData() async {
    try {
      // Call the Firebase Functions HTTP endpoint 'getSecurityData'
      final HttpsCallableResult<dynamic> callable = await FirebaseFunctions
          .instance
          .httpsCallable('getSecurityData')
          .call();

      // Parse the JSON response from the callable as a List of Maps
      final List<dynamic> response =
          json.decode(callable.data as String) as List<dynamic>;
      final List<Map<String, dynamic>> result = List.castFrom(response);

      // Convert the List of Maps to a List of CloudData objects using CloudData.fromJson()
      final List<CloudData> cloudData = result
          .map((Map<String, dynamic> item) => CloudData.fromJson(item))
          .toList();

      // Return the List of CloudData objects
      return cloudData;
    } catch (e, stackTrace) {
      // Print an error message and return an empty List if an error occurs
      if (kDebugMode) {
        print('Error in getSecurityData: $e, $stackTrace');
      }
      return <CloudData>[];
    }
  }

  Future<List<GCloudData>> getGCloudData() async {
    try {
      // Call the Firebase Functions HTTP endpoint 'getGCloudData'
      final HttpsCallableResult<dynamic> callable = await FirebaseFunctions
          .instance
          .httpsCallable('getGCloudData')
          .call();

      // Parse the JSON response from the callable as a List of Maps
      final List<dynamic> response =
          json.decode(callable.data as String) as List<dynamic>;
      final List<Map<String, dynamic>> result = List.castFrom(response);

      // Convert the List of Maps to a List of GCloudData objects using GCloudData.fromJson()
      final List<GCloudData> gcloudData = result
          .map((Map<String, dynamic> item) => GCloudData.fromJson(item))
          .toList();

      // Return the List of GCloudData objects
      return gcloudData;
    } catch (e, stackTrace) {
      // Print an error message and return an empty List if an error occurs
      if (kDebugMode) {
        print('Error in getGCloudData: $e, $stackTrace');
      }
      return <GCloudData>[];
    }
  }

  Future<List<DatabaseArchitecture>> getDatabaseComparisonQuestions() async {
    try {
      // Call the Firebase Functions HTTP endpoint 'getDatabaseComparisonQuestions'
      final HttpsCallableResult<dynamic> callable = await FirebaseFunctions
          .instance
          .httpsCallable('getDatabaseComparisonQuestions')
          .call();

      // Parse the JSON response from the callable as a List of Maps
      final List<dynamic> response =
          json.decode(callable.data as String) as List<dynamic>;
      final List<Map<String, dynamic>> result = List.castFrom(response);

      // Convert the List of Maps to a List of GCloudData objects using GCloudData.fromJson()
      final List<DatabaseArchitecture> items = result
          .map((Map<String, dynamic> item) =>
              DatabaseArchitecture.fromJson(item))
          .toList();

      // Return the List of GCloudData objects
      return items;
    } catch (e, stackTrace) {
      // Print an error message and return an empty List if an error occurs
      if (kDebugMode) {
        print('Error in getDatabaseComparisonQuestions: $e, $stackTrace');
      }
      return <DatabaseArchitecture>[];
    }
  }

  Future<List<String>> getFactsData() async {
    try {
      // Call the Firebase Functions HTTP endpoint 'getFactsData'
      final HttpsCallableResult<dynamic> callable =
          await FirebaseFunctions.instance.httpsCallable('getFactsData').call();

      // Parse the JSON response from the callable as a List of Maps
      final List<dynamic> response =
          json.decode(callable.data as String) as List<dynamic>;
      final List<Map<String, dynamic>> result = List.castFrom(response);

      // Convert the List of Maps to a List of QuickFact objects using QuickFact.fromJson()
      final List<String> facts = result
          .map((Map<String, dynamic> item) => item['fact'] as String)
          .toList();

      // Return the List of QuickFact objects
      return facts;
    } catch (e, stackTrace) {
      // Print an error message and return an empty List if an error occurs
      if (kDebugMode) {
        print('Error in getFactsData: $e, $stackTrace');
      }
      return <String>[];
    }
  }

  Future<void> openAITest(String service) async {
    final HttpsCallable createFacts =
        FirebaseFunctions.instance.httpsCallable('createFacts');
    createFacts(<String, dynamic>{
      'service': service,
    });
  }

  Future<void> serviceDataGenerator(
      String service, String serviceType, String provider) async {
    final HttpsCallable serviceDataGenerator =
        FirebaseFunctions.instance.httpsCallable('serviceDataGenerator');
    serviceDataGenerator(<String, dynamic>{
      'service': service,
      'serviceType': serviceType,
      'provider': provider
    });
  }

  Future<void> updateServiceField(
      {required String service,
      required String field,
      required String provider}) async {
    if (kDebugMode) {
      print('$service $field $provider');
    }
    final HttpsCallable updateServiceField =
        FirebaseFunctions.instance.httpsCallable('updateServiceField');
    updateServiceField(<String, dynamic>{
      'service': service,
      'field': field,
      'provider': provider
    });
  }
}
