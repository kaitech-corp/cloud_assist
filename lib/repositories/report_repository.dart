import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../bloc/generics/generic_bloc.dart';
import '../models/report_model/report_model.dart';

class ReportRepository extends GenericBlocRepository<ReportModel> {
  @override
  Stream<List<ReportModel>> data() {
    final Query<Object> reportCollection = FirebaseFirestore.instance
        .collection('reports');

    // Get all Quick Facts
    List<ReportModel> reportListFromSnapshot(QuerySnapshot<Object> snapshot) {
      try {
        final List<ReportModel> reportList =
            snapshot.docs.map((QueryDocumentSnapshot<Object> doc) {
          return ReportModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
        return reportList;
      } catch (e) {
        if (kDebugMode) {
          // ignore: noop_primitive_operations
          print('Error in Report Repository: ${e.toString()}');
        }
        return <ReportModel>[];
      }
    }

    return reportCollection.snapshots().map(reportListFromSnapshot);
  }
}
