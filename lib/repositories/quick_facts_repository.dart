import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../bloc/generics/generic_bloc.dart';
import '../models/quick_fact_model/quick_fact_model.dart';
import '../screens/home/home.dart';

class QuickFactsRepository extends GenericBlocRepository<QuickFact> {
  @override
  Stream<List<QuickFact>> data() {
    final Query<Object> quickFactsCollection = FirebaseFirestore.instance
        .collection('quickFacts')
        .orderBy('timestamp')
        .limit(fetchCount.value);

    // Get all Quick Facts
    List<QuickFact> factListFromSnapshot(QuerySnapshot<Object> snapshot) {
      try {
        final List<QuickFact> factList =
            snapshot.docs.map((QueryDocumentSnapshot<Object> doc) {
          return QuickFact.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
        return factList;
      } catch (e) {
        if (kDebugMode) {
          // ignore: noop_primitive_operations
          print('Error in Repository: ${e.toString()}');
        }
        return <QuickFact>[];
      }
    }

    return quickFactsCollection.snapshots().map(factListFromSnapshot);
  }
}
