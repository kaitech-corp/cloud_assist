import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';

import '../../services/constants.dart';
import '../../services/firebase_functions/cloud_functions.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/ui/text_styles.dart';
import 'components/fade_shimmer.dart';

///Data class for home
class DatabaseServices extends StatefulWidget {
  const DatabaseServices({super.key});

  @override
  State<DatabaseServices> createState() => _DatabaseServicesState();
}

class _DatabaseServicesState extends State<DatabaseServices> {
  @override
  void initState() {
    RealTimeDatabase().saveUserInteraction(
        featureId: FeatureID.data.toString(), startTime: true, endTime: false);
    super.initState();
  }

  @override
  void dispose() {
    RealTimeDatabase().saveUserInteraction(
        featureId: FeatureID.data.toString(), startTime: false, endTime: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CloudData>?>(
        future: CloudFunctions().getDatabaseData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CloudData>?> snapshot) {
          if (snapshot.hasData) {
            final List<CloudData> data = snapshot.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final CloudData cloudData = data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          context.goNamed('serviceDetails', extra: cloudData);
                          RealTimeDatabase().saveUserInteraction(
                              serviceId: cloudData.service,
                              featureId: FeatureID.data.toString(),
                              startTime: true,
                              endTime: false);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                cloudData.service,
                                style: titleMedium(context),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 8),
                              Container(height: 2, color: Colors.grey[400]),
                            ],
                          ),
                        )),
                  );
                });
            // } else if(snapshot.connectionState==ConnectionState.waiting){
          } else {
            return loadingShimmer();
          }
        });
  }
}
