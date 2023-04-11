import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../models/comparison_model/comparison_model.dart';

/// Interface to our 'userPublicProfile' Firebase collection.
/// It contains the public answer infos for all users.
///
/// Relies on a remote NoSQL document-oriented database.
class ComparisonModelRepository {
  final CollectionReference<Object?> databaseComparisonCollection =
      FirebaseFirestore.instance.collection('databaseComparison');
  final StreamController<ComparisonModel> _loadedData =
      StreamController<ComparisonModel>.broadcast();

  StreamSubscription<ComparisonModel>? _subscription;

  void dispose() {
    _loadedData.close();
    _subscription?.cancel();
  }

  void refresh(String docID) {
    _subscription?.cancel();
    _subscription = databaseComparisonCollection
        .doc(docID)
        .snapshots()
        .map((DocumentSnapshot<Object?> snapshot) {
      if (snapshot.exists) {
        final Map<String, Object?> doc =
            snapshot.data() as Map<String, Object?>;
        return ComparisonModel.fromJson(doc);
      } else {
        return const ComparisonModel(
          answer: '',
          docID: '12345',
          answersSelected: <Map<String, String>>[],
        );
      }
    }).handleError((dynamic error) {
      if (kDebugMode) {
        print('Error retrieving database solution: $error');
      }
    }).listen((ComparisonModel answer) => _loadedData.add(answer));
  }

  Stream<ComparisonModel> get answer => _loadedData.stream;
}
