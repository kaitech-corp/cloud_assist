// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloudassist/bloc/bloc_observer/custom_bloc_observer.dart';
// import 'package:cloudassist/models/cloud_data_model/cloud_data_model.dart';
// import 'package:cloudassist/repositories/cloud_data_repository.dart';
// import 'package:cloudassist/services/firebase_functions/cloud_functions.dart';
// import 'package:cloudassist/services/firebase_functions/firebase_functions.dart';
// import 'package:cloudassist/services/project_initializer.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class MockCollectionReference extends Mock implements CollectionReference {}
// class MockQuerySnapshot extends Mock implements QuerySnapshot {}
// class MockQueryDocumentSnapshot extends Mock implements QueryDocumentSnapshot {}
// class MockCloudFunctions extends Mock implements CloudFunctions {}
// class MockWidgetsFlutterBinding extends Mock implements WidgetsFlutterBinding {}

// void main() {

//   setUp(() {
//     // when(binding.ensureInitialized()).thenAnswer((_) async {});
//     // when(Firebase.initializeApp()).thenAnswer((_) async {});
//   });

//   group('projectInitializer', () {
//     test('should initialize Firebase and set CustomBlocObserver', () async {
//       final String result = await projectInitializer();

//       expect(result, 'initialized');
//       verify(WidgetsFlutterBinding.ensureInitialized());
//       verify(Firebase.initializeApp());
//       expect(Bloc.observer, isInstanceOf<CustomBlocObserver>());
//     });

//     test('getFacts should return non-null data for Anthos', () async {
//       const String docID = 'Anthos';
//       final List<String?>? facts = await FirestoreDatabase().getFacts(docID);
//       expect(facts, isNotNull);
//     });

//     test('data should return non-null data', () async {
//       final CloudDataRepository repository = CloudDataRepository();
//       final Stream<List<CloudData>> dataStream = repository.data();
//       expect(dataStream, isNotNull);
//     });
//   });
// }
