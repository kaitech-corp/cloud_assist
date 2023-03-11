import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../models/quick_fact_model/quick_fact_model.dart';
import '../api/facts.dart';
import 'cloud_functions.dart';
import 'functions.dart';

class FirestoreDatabase {
  CollectionReference<Object?> quickFactsCollection =
      FirebaseFirestore.instance.collection('quickFacts');

  void saveFacts() {
    for (final String fact in factList.getRange(3, 6)) {
      try {
        final String docID = quickFactsCollection.doc().id;
        final QuickFact quickFact = QuickFact(
            docID: docID,
            fact: fact,
            flag: 'none',
            service: 'general',
            timestamp: DateTime.now());
        quickFactsCollection.doc().set(quickFact.toJson());
      } catch (e) {
        if (kDebugMode) {
          print('Error saving quick facts: $e');
        }
      }
    }
  }

  Future<String?> getFacts(String service) async {
    final String docName = removeCloudAndWhitespace(service);
    final CollectionReference<Object?> funFactsCollection = FirebaseFirestore
        .instance
        .collection('services')
        .doc(docName)
        .collection('facts');
    try {
      final QuerySnapshot<Object?> ref = await funFactsCollection.get();
      if (ref.docs.isEmpty) {
        CloudFunctions().openAITest(service);
      } else {
        final List<String> fact =
            ref.docs.map((item) => item['fact'] as String).toList();
        return getRandomValueFromList(fact) as String;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
