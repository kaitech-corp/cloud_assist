import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';

import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/ui/text_styles.dart';

///Screen for listing networking data
class NetworkingServices extends StatefulWidget {
  const NetworkingServices({super.key, required this.cloudData});
  final List<CloudData> cloudData;
  @override
  State<NetworkingServices> createState() => _NetworkingServicesState();
}

class _NetworkingServicesState extends State<NetworkingServices> {
  @override
  void initState() {
    RealTimeDatabase().saveUserInteraction(
        featureId: FeatureID.networking.toString(),
        startTime: true,
        endTime: false);
    super.initState();
  }

  @override
  void dispose() {
    RealTimeDatabase().saveUserInteraction(
        featureId: FeatureID.networking.toString(),
        startTime: false,
        endTime: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Iterable<CloudData> filteredData =
        widget.cloudData.where((data) => data.type == 'Networking');
    return ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (BuildContext context, int index) {
          final CloudData cloudData = filteredData.toList()[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  context.goNamed('serviceDetails', extra: cloudData);
                  RealTimeDatabase().saveUserInteraction(
                      serviceId: cloudData.service,
                      featureId: FeatureID.networking.toString(),
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
  }
}
