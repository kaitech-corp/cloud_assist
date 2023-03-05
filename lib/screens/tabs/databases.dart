import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../services/api/api.dart';
import '../../services/service_config/service_config.dart';
import '../../services/ui/text_styles.dart';


///Data class for home
class DatabaseServices extends StatefulWidget {
  const DatabaseServices({super.key});

  @override
  State<DatabaseServices> createState() => _DatabaseServicesState();
}

class _DatabaseServicesState extends State<DatabaseServices> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CloudData>?>(
        future: CloudDataAPI().getDatabaseData(),
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
                            children: [
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
            return Column(
              children: List<Widget>.generate(
                  8,
                  (int index) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FadeShimmer(
                            height: 8,
                            width: SizeConfig.screenWidth,
                            radius: 4,
                            highlightColor: const Color(0xffF9F9FB),
                            baseColor: const Color(0xffE6E8EB),
                          ),
                        ),
                      )),
            );
          }
        });
  }
}
