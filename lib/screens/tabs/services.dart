import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/firebase_functions/functions.dart';
import '../../services/ui/text_styles.dart';
import 'components/fade_shimmer.dart';

///Data class for home
class PopularServices extends StatefulWidget {
  const PopularServices({super.key, required this.cloudData});

  final List<CloudData> cloudData;
  @override
  State<PopularServices> createState() => _PopularServicesState();
}

class _PopularServicesState extends State<PopularServices> {
  @override
  void initState() {
    RealTimeDatabase().saveUserInteraction(
        featureId: FeatureID.popularServices.toString(),
        startTime: true,
        endTime: false);
    super.initState();
  }

  @override
  void dispose() {
    RealTimeDatabase().saveUserInteraction(
        featureId: FeatureID.popularServices.toString(),
        startTime: false,
        endTime: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>?>(
        future: FirestoreDatabase().getPopularServiceIds(),
        builder: (BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
          if (snapshot.hasData) {
            final List<String> data = snapshot.data!;
            List<CloudData> popularServices =
                transformAndFilter(widget.cloudData, data) as List<CloudData>;
            return ListView.builder(
                itemCount: popularServices.length,
                itemBuilder: (BuildContext context, int index) {
                  final CloudData cloudData = popularServices[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          context.goNamed('serviceDetails', extra: cloudData);
                          RealTimeDatabase().saveUserInteraction(
                              serviceId: cloudData.service,
                              featureId: FeatureID.popularServices.toString(),
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
