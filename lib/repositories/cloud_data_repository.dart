import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../bloc/generics/generic_bloc.dart';
import '../models/cloud_data_model/cloud_data_model.dart';

class CloudDataRepository extends GenericBlocRepository<CloudData> {
  @override
  Stream<List<CloudData>> data() {
    final Query<Object> cloudDataCollection =
        FirebaseFirestore.instance.collection('services');

    // Get all Quick Facts
    List<CloudData> serviceListFromSnapshot(QuerySnapshot<Object> snapshot) {
      try {
        final List<CloudData> serviceList =
            snapshot.docs.map((QueryDocumentSnapshot<Object> doc) {
          return CloudData.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
        
        return serviceList;
      } catch (e) {
        if (kDebugMode) {
          print('Error in Cloud Data Repository: $e');
        }
        return <CloudData>[];
      }
    }

    return cloudDataCollection.snapshots().map(serviceListFromSnapshot);
  }
}
