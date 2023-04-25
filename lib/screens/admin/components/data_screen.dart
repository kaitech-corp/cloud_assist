import 'package:flutter/material.dart';

import '../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../models/quick_fact_model/quick_fact_model.dart';
import '../../../services/firebase_functions/firebase_functions.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder<List<dynamic>>(
          future: FirestoreDatabase().getReportsData(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            return ListTile(
              title: const Text('Generated Reports'),
              subtitle: Text('${snapshot.data?.length ?? 0} reports'),
            );
          },
        ),
        FutureBuilder<List<dynamic>>(
          future: FirestoreDatabase().getDatabaseComparisonData(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            return ListTile(
              title: const Text('Generated Database Solutions'),
              subtitle: Text('${snapshot.data?.length ?? 0} solutions'),
            );
          },
        ),
        FutureBuilder<List<dynamic>>(
          future: RealTimeDatabase().listInteractionsForUsers(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            return ListTile(
              title: const Text('Users with Interactions'),
              subtitle: Text('${snapshot.data?.length ?? 0} users'),
            );
          },
        ),
        FutureBuilder<List<QuickFact>>(
          future: FirestoreDatabase().getQuickFactsData(),
          builder:
              (BuildContext context, AsyncSnapshot<List<QuickFact>> snapshot) {
            return ListTile(
              title: const Text('Quick Facts'),
              subtitle: Text('${snapshot.data?.length ?? 0} facts'),
            );
          },
        ),
        FutureBuilder<List<CloudData>>(
          future: FirestoreDatabase().getServiceData(),
          builder:
              (BuildContext context, AsyncSnapshot<List<CloudData>> snapshot) {
            return ListTile(
              title: const Text('Services'),
              subtitle: Text('${snapshot.data?.length ?? 0} services'),
            );
          },
        ),
      ],
    );
  }
}