import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/gcloud_data_model/gcloud_data_model.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/cloud_functions.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/ui/text_styles.dart';
import 'components/fade_shimmer.dart';

class GCloudScreen extends StatefulWidget {
  const GCloudScreen({super.key});

  @override
  State<GCloudScreen> createState() => _GCloudScreenState();
}

class _GCloudScreenState extends State<GCloudScreen> {
  @override
  void initState() {
    FirestoreDatabase().saveUserInteraction(
        featureId: FeatureID.commandlines.toString(),
        startTime: true,
        endTime: false);
    super.initState();
  }

  @override
  void dispose() {
    FirestoreDatabase().saveUserInteraction(
        featureId: FeatureID.commandlines.toString(),
        startTime: false,
        endTime: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GCloudData>?>(
        future: CloudFunctions().getGCloudData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<GCloudData>?> snapshot) {
          if (snapshot.hasData) {
            final List<GCloudData> data = snapshot.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final GCloudData gCloudData = data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        context.goNamed('gcloud', extra: gCloudData);
                        FirestoreDatabase().saveUserInteraction(
                            serviceId: gCloudData.topic,
                            featureId: FeatureID.commandlines.toString(),
                            startTime: true,
                            endTime: false);
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                gCloudData.topic,
                                style: titleMedium(context),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 8),
                              Container(height: 2, color: Colors.grey[400]),
                            ],
                          )),
                    ),
                  );
                });
            // } else if(snapshot.connectionState==ConnectionState.waiting){
          } else {
            return loadingShimmer();
          }
        });
  }
}
