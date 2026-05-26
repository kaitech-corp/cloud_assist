import 'package:cloud_firestore/cloud_firestore.dart';

import '../bloc/generics/generic_bloc.dart';
import '../models/comparison_model/comparison_model.dart';
import '../services/service_locator.dart';
import 'user_repository.dart';

class SolutionsRepository extends GenericBlocRepository<ComparisonModel> {
  @override
  Stream<List<ComparisonModel>> data() {
    final String? uid = locator<UserRepository>().getUserID();
    final Query<Object> solutionCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(uid).collection('generatedSolution').orderBy('timestamp',descending: true);

    // Get all Quick Facts
    List<ComparisonModel> solutionListFromSnapshot(
        QuerySnapshot<Object> snapshot) {
      try {
        final List<ComparisonModel> solutionList =
            snapshot.docs.map((QueryDocumentSnapshot<Object> doc) {
          return ComparisonModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
        return solutionList;
      } catch (e) {
        return <ComparisonModel>[];
      }
    }

    return solutionCollection.snapshots().map(solutionListFromSnapshot);
  }
}
