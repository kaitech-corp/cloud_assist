import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../models/cloud_data_model/cloud_data_model.dart';


/// Repository for Featured Services
class FeaturedServicesRepository {
  final CollectionReference<Object?> featuredServicesCollection =
      FirebaseFirestore.instance.collection('featured');
  final StreamController<List<CloudData>> _loadedData =
      StreamController<List<CloudData>>.broadcast();

  StreamSubscription<CloudData>? _subscription;

  void dispose() {
    _loadedData.close();
    _subscription?.cancel();
  }

 void refresh() {
    _subscription?.cancel();
    _subscription = featuredServicesCollection.snapshots().listen((QuerySnapshot<Object?> snapshot) {
      // Process the snapshot data and convert it to a List<CloudData>
      final List<CloudData> dataList = <CloudData>[];
      for (final QueryDocumentSnapshot<Object?> doc in snapshot.docs) {
        final CloudData data = CloudData.fromJson(doc.data() as Map<String, dynamic>);
        dataList.add(data);
      }

      // Add the List<CloudData> to the stream
      _loadedData.sink.add(dataList);
    }) as StreamSubscription<CloudData>?;
  }

Stream<List<CloudData>> get answer => _loadedData.stream;
}
