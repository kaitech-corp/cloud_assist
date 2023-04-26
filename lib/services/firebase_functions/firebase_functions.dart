// ignore_for_file: cast_nullable_to_non_nullable

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../models/comparison_model/comparison_model.dart';
import '../../models/quick_fact_model/quick_fact_model.dart';
import '../../models/report_content_model/report_content_model.dart';
import '../../models/report_model/report_model.dart';
import '../../models/user_model/user_model.dart';
import '../../repositories/user_repository.dart';
import '../../screens/database_comparison/bloc/event.dart';
import 'cloud_functions.dart';
import 'functions.dart';

class FirestoreDatabase {
  // Collection References
  CollectionReference<Object?> quickFactsCollection =
      FirebaseFirestore.instance.collection('quickFacts');
  CollectionReference<Object?> apiStatusCollection =
      FirebaseFirestore.instance.collection('apiStatus');
  final CollectionReference<Object?> databaseComparison =
      FirebaseFirestore.instance.collection('databaseComparison');
  final CollectionReference<Object?> servicesCollection =
      FirebaseFirestore.instance.collection('services');
  final CollectionReference<Object?> usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference<Object?> reportCollection =
      FirebaseFirestore.instance.collection('reports');
  final CollectionReference<Object?> reportedContentCollection =
      FirebaseFirestore.instance.collection('reportedContent');
  final CollectionReference<Object?> popularServicesCollection =
      FirebaseFirestore.instance.collection('popularServices');

  Future<List<String?>?> getFacts(String service) async {
    final String docName = removeCloudAndWhitespace(service);
    final CollectionReference<Object?> funFactsCollection = FirebaseFirestore
        .instance
        .collection('services')
        .doc(docName)
        .collection('facts');
    try {
      final QuerySnapshot<Object?> ref = await funFactsCollection.get();
      if (ref.docs.isEmpty) {
        CloudFunctions().createNewFactsManually(service);
      } else {
        final List<String> facts = ref.docs
            .map(
                (QueryDocumentSnapshot<Object?> item) => item['fact'] as String)
            .toList();
        return facts;
      }
    } catch (e) {
      if (kDebugMode) {
        print('getFacts error  in firebase_functions: $e');
      }
    }
    return null;
  }

  // Check if API data has been updated
  Future<bool> shouldFetchFromAPI(String api) async {
    final String lastDateUpdated = '${api}date';
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonData = prefs.getString(api);
    final String? jsonDateData = prefs.getString(lastDateUpdated);

    try {
      final dynamic storedData = jsonDecode(jsonData!);
      final dynamic dateData = jsonDecode(jsonDateData!);

      final DocumentSnapshot<Object?> apiData =
          await apiStatusCollection.doc(api).get();
      final dynamic response = apiData.get('lastUpdated');
      final String timestamp = response.millisecondsSinceEpoch.toString();
      if (kDebugMode) {
        print('From Firebase: $timestamp');
        print('From Local Storage: $dateData');
        print(timestamp == dateData);
      }
      if (storedData == null || timestamp.toString() != dateData.toString()) {
        await prefs.remove(api);
        await prefs.remove(lastDateUpdated);
        await prefs.setString(lastDateUpdated, timestamp);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('shouldFetchFromAPI: $e');
      }
      return true;
    }
  }

  // Save API data to shared preferences
  Future<void> saveAPIData(String api, List<CloudData> cloudData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print('saving api data');
    }
    try {
      await prefs.setString(api, jsonEncode(cloudData));
    } catch (e) {
      if (kDebugMode) {
        print('saveAPIData error in firebase_functions: $e');
      }
    }
  }

  Future<List<CloudData>> apiCall(String api) async {
    final bool fetchAPI = await shouldFetchFromAPI(api);

    if (fetchAPI) {
      if (kDebugMode) {
        print('Making api call');
      }
      final List<CloudData> cloudData =
          await CloudFunctions().getCombinedCloudData();
      return cloudData;
    } else {
      if (kDebugMode) {
        print('Pulling data from local storage');
      }
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? jsonData = prefs.getString(api);
      final List<dynamic> response = json.decode(jsonData!) as List<dynamic>;
      final List<Map<String, dynamic>> result = List.castFrom(response);
      final List<CloudData> cloudData = result
          .map((Map<String, dynamic> item) => CloudData.fromJson(item))
          .toList();
      return cloudData;
    }
  }

  Future<void> saveAnswers(List<AnswersSelected> answersSelected) async {
    final String hash = answersSelected.toString().hashCode.toString();
    final bool docExists = await checkDocExists(hash);

    if (!docExists) {
      try {
        final Map<String, List<Map<String, dynamic>>> data =
            <String, List<Map<String, dynamic>>>{
          'answersSelected': answersSelected
              .map((AnswersSelected answer) => answer.toJson())
              .toList(),
        };

        final DocumentReference<Object?> ref = databaseComparison.doc(hash);
        ref.set(data);
        ref.update(<String, dynamic>{
          'docID': hash,
        });

        int retryCount = 0;
        bool answerNotEmpty = false;

        while (retryCount < 3 && !answerNotEmpty) {
          // Wait for 10 seconds
          await Future<void>.delayed(const Duration(seconds: 10));

          // Check if 'answer' field is non-empty
          final DocumentSnapshot<Object?> snapshot = await ref.get();
          final Map<String, dynamic>? data =
              snapshot.data() as Map<String, dynamic>?;
          final String answer = data?['answer'] as String? ?? '';
          answerNotEmpty = answer.isNotEmpty;

          retryCount++;
        }

        if (answerNotEmpty) {
          // Copy document to 'generatedSolution' collection in user's document
          final String? uid = UserRepository().getUserID();
          final DocumentSnapshot<Object?> snapshot = await ref.get();
          final DocumentReference<Object?> userDocRef = usersCollection
              .doc(uid)
              .collection('generatedSolution')
              .doc(hash);
          await userDocRef.set(snapshot.data());
        }
      } catch (e) {
        if (kDebugMode) {
          print('saveAnswers error in firebase_functions: $e');
        }
      }
    }
  }

  Future<void> saveSolutionToUserDocument(ComparisonModel model) async {
    final String? uid = UserRepository().getUserID();
    try {
      final DocumentReference<Object?> ref = usersCollection
          .doc(uid)
          .collection('generatedSolution')
          .doc(model.docID);

      // Use set method with SetOptions(merge: true) to create or update document
      await ref.set(model.toJson(), SetOptions(merge: true));
    } catch (e) {
      if (kDebugMode) {
        print('Error in saveSolutionToUserDocument: $e');
      }
    }
  }

  Future<bool> checkDocExists(String docID) async {
    final DocumentSnapshot<Object?> ref =
        await databaseComparison.doc(docID).get();
    return ref.exists;
  }

  Stream<ComparisonModel> getDatabaseAnswer(
      List<AnswersSelected> answersSelected) {
    final String docID = answersSelected.toString().hashCode.toString();
    final Stream<DocumentSnapshot<Object?>> ref =
        databaseComparison.doc(docID).snapshots();
    // Use snapshots() instead of get() to get a Stream<DocumentSnapshot> object
    return ref.map((DocumentSnapshot<Object?> doc) =>
        ComparisonModel.fromJson(doc.data()! as Map<String, dynamic>));
    // Use map() to convert the Stream<DocumentSnapshot> into a Stream<ComparisonModel>
  }

  Future<void> writeCloudData(CloudData cloudData) async {
    try {
      final String serviceName = removeCloudAndWhitespace(cloudData.service);
      final DocumentReference<Object?> ref =
          servicesCollection.doc(serviceName);
      final DocumentSnapshot<Object?> exists = await ref.get();
      if (!exists.exists) {
        ref.set(cloudData.toJson());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<UserModel> getProfileData() async {
    final User? currentUser = UserRepository().getUser();
    try {
      final DocumentReference<Object?> ref =
          usersCollection.doc(currentUser!.uid);
      final DocumentSnapshot<Object?> doc = await ref.get();
      return UserModel.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving user profile: $e');
      }
      return defaultUserModel;
    }
  }

  // Admin Functions
  Future<List<UserModel>?> getUsers() async {
    final QuerySnapshot<Object?> ref = await usersCollection.get();
    try {
      final List<UserModel> users = ref.docs
          .map((QueryDocumentSnapshot<Object?> doc) =>
              UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      users.sort((UserModel a, UserModel b) =>
          b.dateCreated!.compareTo(a.dateCreated!));
      return users;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return <UserModel>[];
    }
  }

  Future<void> updateProviderField() async {
    // Get the documents within the collection
    final QuerySnapshot<Object?> snapshot = await servicesCollection.get();

    // Create a batch
    final WriteBatch batch = FirebaseFirestore.instance.batch();

    // Loop through each document in the snapshot
    snapshot.docs.forEach((QueryDocumentSnapshot<Object?> doc) {
      // Update the 'provider' field with the value 'gcp'
      batch.update(doc.reference, <String, String>{'type': ''});
    });

    // Commit the batch
    await batch.commit();
  }

  Future<void> batchWriteQuickFacts(List<String> facts) async {
    // Create a Firestore instance
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Create a Firestore batch
    final WriteBatch batch = firestore.batch();

    // Loop through each fact in the list
    for (final String fact in facts) {
      // Generate a unique document ID
      final String docID = quickFactsCollection.doc().id;

      // Create a QuickFact object with default values
      final QuickFact quickFact = QuickFact(
        fact: fact,
        docID: docID,
        service: 'general',
        flag: '',
      );

      // Convert the QuickFact object to a map
      final Map<String, dynamic> quickFactData = <String, dynamic>{
        'fact': quickFact.fact,
        'docID': quickFact.docID,
        'service': quickFact.service,
        'flag': quickFact.flag,
        'timestamp':
            FieldValue.serverTimestamp(), // set to server-side timestamp
      };

      // Add the set operation to the batch
      batch.set(quickFactsCollection.doc(docID), quickFactData);
    }

    // Commit the batch write
    await batch.commit();
  }
// Batch write a field update
// Future<void> updateFieldValue() async {
//   final ref = await servicesCollection.get();

//   final batch = FirebaseFirestore.instance.batch();

//   for (final doc in ref.docs) {
//     batch.update(doc.reference, {'type': ''});
//   }

//   await batch.commit();
// }

  Future<List<ReportModel>> getReportsData() async {
    final QuerySnapshot<Object?> ref = await reportCollection.get();
    try {
      final List<ReportModel> report = ref.docs
          .map((QueryDocumentSnapshot<Object?> doc) =>
              ReportModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return report;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return <ReportModel>[];
    }
  }

  Future<List<QuickFact>> getQuickFactsData() async {
    final QuerySnapshot<Object?> ref = await quickFactsCollection.get();
    try {
      final List<QuickFact> facts = ref.docs
          .map((QueryDocumentSnapshot<Object?> doc) =>
              QuickFact.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return facts;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return <QuickFact>[];
    }
  }

  Future<List<CloudData>> getServiceData() async {
    final QuerySnapshot<Object?> ref = await servicesCollection.get();
    try {
      final List<CloudData> facts = ref.docs
          .map((QueryDocumentSnapshot<Object?> doc) =>
              CloudData.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return facts;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return <CloudData>[];
    }
  }

  Future<List<dynamic>> getDatabaseComparisonData() async {
    final QuerySnapshot<Object?> ref = await databaseComparison.get();
    try {
      final List<ComparisonModel> data = ref.docs
          .map((QueryDocumentSnapshot<Object?> doc) =>
              ComparisonModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return <UserModel>[];
    }
  }

// This is an asynchronous function that increments the
// popularity count of a document in a Firestore database.
  Future<void> incrementPopularity(String service) async {
    final String docID = removeCloudAndWhitespace(service);
    final DocumentReference<Object?> documentReference =
        popularServicesCollection.doc(docID);

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot<Object?> documentSnapshot =
          await transaction.get(documentReference);

      if (!documentSnapshot.exists) {
        throw Exception('Document does not exist!');
      }

      final dynamic currentPopularity = documentSnapshot.get('popularity') ?? 0;
      transaction.update(documentReference, <String, dynamic>{
        'popularity': currentPopularity + 1,
        'lastUpdated': FieldValue.serverTimestamp()
      });
    });
  }

  Future<List<String>> getPopularServiceIds() async {
    final QuerySnapshot<Object?> querySnapshot = await popularServicesCollection
        .orderBy('popularity', descending: true)
        .limit(15)
        .get();

    final List<String> popularServiceIds = querySnapshot.docs
        .map((QueryDocumentSnapshot<Object?> doc) => doc.id)
        .toList();
    return popularServiceIds;
  }

  Future<void> reportContent(ReportContent reportContent) async {
    final String docID = reportedContentCollection.doc().id;
    final String contentDocID =
        removeCloudAndWhitespace(reportContent.contentDocID);
    final String? uid = UserRepository().getUserID();
    reportedContentCollection.doc(docID).set(<String, dynamic>{
      'content': reportContent.content,
      'contentType': reportContent.reportType,
      'contentDocID': contentDocID,
      'contentField': reportContent.contentField,
      'docID': docID,
      'timestamp': FieldValue.serverTimestamp(),
      'uid': uid
    }).then((value) {
      RealTimeDatabase().saveUserInteraction(
        startTime: true,
        endTime: false,
        serviceId: reportContent.contentDocID,
        featureId: reportContent.reportType,
        docID: docID,
      );
    });
  }
}

class RealTimeDatabase {
  // Function to save user interactions to the Realtime Database
  void saveUserInteraction(
      {String? serviceId,
      String? featureId,
      required bool startTime,
      required bool endTime,
      String? docID}) {
    final String? userId = UserRepository().getUserID();
    final FirebaseDatabase databaseReference = FirebaseDatabase.instance;
    final Map<String, dynamic> userTimeData = <String, dynamic>{
      'serviceId': serviceId,
      'featureId': featureId,
      'docID': docID,
      'startTime': startTime ? ServerValue.timestamp : null,
      'endTime': endTime ? ServerValue.timestamp : null
    };

    // Save UserInteractionModel to the Realtime Database
    try {
      databaseReference
          .ref()
          .child('user_interaction_data')
          .child(userId!)
          .push()
          .set(userTimeData);
    } catch (e) {
      if (kDebugMode) {
        print('Error saving user interaction: $e');
      }
      databaseReference
          .ref()
          .child('user_interaction_data')
          .child('00000000')
          .set(userTimeData);
    }
  }

  // Function to list the number of interactions for each user
  Future<List<dynamic>> listInteractionsForUsers() async {
    // Get a reference to the 'user_interaction_data' node in Realtime Database
    final DatabaseReference ref =
        FirebaseDatabase.instance.ref().child('user_interaction_data');

    final DataSnapshot snapshot = await ref.get();
    return snapshot.children.toList();
  }
}
