import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../bloc/generics/generic_bloc.dart';
import '../models/comparison_model/comparison_model.dart';
import 'user_repository.dart';

class SolutionsRepository extends GenericBlocRepository<ComparisonModel> {
  @override
  Stream<List<ComparisonModel>> data() {
    final String? uid = UserRepository().getUserID();
    final Query<Object> solutionCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(uid).collection('generatedSolution');

    // Get all Quick Facts
    List<ComparisonModel> solutionListFromSnapshot(
        QuerySnapshot<Object> snapshot) {
      try {
        final List<ComparisonModel> solutionList =
            snapshot.docs.map((QueryDocumentSnapshot<Object> doc) {
          return ComparisonModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList().reversed.toList();
        return solutionList;
      } catch (e) {
        if (kDebugMode) {
          // ignore: noop_primitive_operations
          print('Error in Solutions Repository: ${e.toString()}');
        }
        return <ComparisonModel>[];
      }
    }

    return solutionCollection.snapshots().map(solutionListFromSnapshot);
  }
}
