import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../models/comparison_model/comparison_model.dart';

class DatabaseSolutionResult {
  const DatabaseSolutionResult({
    required this.model,
    required this.status,
    this.errorMessage,
  });

  final ComparisonModel model;
  final String status;
  final String? errorMessage;

  bool get isComplete => status == 'complete' && model.answer.isNotEmpty;
  bool get isFailed => status == 'failed';
}

/// Interface to our 'userPublicProfile' Firebase collection.
/// It contains the public answer infos for all users.
///
/// Relies on a remote NoSQL document-oriented database.
class ComparisonModelRepository {
  final CollectionReference<Object?> databaseComparisonCollection =
      FirebaseFirestore.instance.collection('databaseComparison');
  final StreamController<DatabaseSolutionResult> _loadedData =
      StreamController<DatabaseSolutionResult>.broadcast();

  StreamSubscription<DatabaseSolutionResult>? _subscription;
  bool _isDisposed = false;

  Future<void> dispose() async {
    _isDisposed = true;
    await _subscription?.cancel();
    await _loadedData.close();
  }

  void refresh(String docID) {
    if (_isDisposed) {
      return;
    }
    _subscription?.cancel();
    _subscription = databaseComparisonCollection
        .doc(docID)
        .snapshots()
        .map((DocumentSnapshot<Object?> snapshot) {
          if (snapshot.exists) {
            final Object? snapshotData = snapshot.data();
            final Map<String, Object?> doc =
                snapshotData is Map<String, Object?>
                ? snapshotData
                : <String, Object?>{};
            final ComparisonModel model =
                ComparisonModel.fromJson(<String, Object?>{
                  ...doc,
                  'answer': doc['answer'] as String? ?? '',
                  'docID': doc['docID'] as String? ?? docID,
                  'answersSelected':
                      doc['answersSelected'] as List<dynamic>? ?? <dynamic>[],
                });
            final String status =
                doc['status'] as String? ??
                (model.answer.isNotEmpty ? 'complete' : 'pending');
            return DatabaseSolutionResult(
              model: model,
              status: status,
              errorMessage: doc['errorMessage'] as String?,
            );
          } else {
            return DatabaseSolutionResult(
              model: ComparisonModel(
                answer: '',
                docID: docID,
                answersSelected: <Map<String, String>>[],
              ),
              status: 'pending',
            );
          }
        })
        .handleError((dynamic error) {
          if (kDebugMode) {
            print('Error retrieving database solution: $error');
          }
        })
        .listen((DatabaseSolutionResult answer) {
          if (!_isDisposed && !_loadedData.isClosed) {
            _loadedData.add(answer);
          }
        });
  }

  Stream<DatabaseSolutionResult> get answer => _loadedData.stream;
}
