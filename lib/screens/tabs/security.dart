import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';

import '../../services/firebase_functions/cloud_functions.dart';
import '../../services/ui/text_styles.dart';

import 'components/fade_shimmer.dart';

///Screen for listing networking data
class SecurityServices extends StatefulWidget {
  const SecurityServices({super.key});

  @override
  State<SecurityServices> createState() => _SecurityServicesState();
}

class _SecurityServicesState extends State<SecurityServices> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CloudData>?>(
        future: CloudFunctions().getSecurityData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CloudData>?> snapshot) {
          if (snapshot.hasData) {
            final List<CloudData> data = snapshot.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final CloudData networkData = data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          context.goNamed('serviceDetails', extra: networkData);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                networkData.service,
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
          } else {
            return loadingShimmer();
          }
        });
  }
}
