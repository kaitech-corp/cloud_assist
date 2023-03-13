import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';

import '../../services/firebase_functions/cloud_functions.dart';
import '../../services/ui/text_styles.dart';
import 'components/fade_shimmer.dart';

///Data class for home
class SearchServices extends StatefulWidget {
  const SearchServices({super.key});

  @override
  State<SearchServices> createState() => _SearchServicesState();
}

class _SearchServicesState extends State<SearchServices> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CloudData>?>(
        future: CloudFunctions().getCloudData(),
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
