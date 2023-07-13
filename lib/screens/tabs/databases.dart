import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';

import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/ui/text_styles.dart';

///Data class for home
class DatabaseServices extends StatefulWidget {
  const DatabaseServices({super.key, required this.cloudData});
  final List<CloudData> cloudData;
  @override
  State<DatabaseServices> createState() => _DatabaseServicesState();
}

class _DatabaseServicesState extends State<DatabaseServices> {
  @override
  void initState() {
    FirestoreDatabase().saveUserInteraction(
        featureId: FeatureID.data.toString(), startTime: true, endTime: false);
    super.initState();
  }

  @override
  void dispose() {
    FirestoreDatabase().saveUserInteraction(
        featureId: FeatureID.data.toString(), startTime: false, endTime: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Iterable<CloudData> filteredData = widget.cloudData
        .where((CloudData data) => data.type == 'Databases' || data.type == 'Storage');
    return ListView.builder(
        itemCount: filteredData.length,
        itemBuilder: (BuildContext context, int index) {
          final CloudData cloudData = filteredData.toList()[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  context.goNamed('serviceDetails', extra: cloudData);
                  FirestoreDatabase().saveUserInteraction(
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
  }
}
