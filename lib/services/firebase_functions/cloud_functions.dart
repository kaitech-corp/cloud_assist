import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';

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

  Future<void> retrieveQuickFacts2() async {
    try {
      final FirebaseFunctions functions = FirebaseFunctions.instance;
      functions.useFunctionsEmulator('127.0.0.1', 5001);
      functions.httpsCallable('retrieveQuickFacts').call();
    } on FirebaseFunctionsException catch (error) {
      if (kDebugMode) {
        print(error.code);
        print(error.details);
        print(error.message);
      }
    }
  }
}
