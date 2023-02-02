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
}
