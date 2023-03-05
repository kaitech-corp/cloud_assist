import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../services/api/api.dart';
import '../../services/service_config/service_config.dart';
import '../../services/ui/text_styles.dart';
import '../../widgets/service_detail_card.dart';

///Screen for listing networking data
class NetworkingServices extends StatefulWidget {
  const NetworkingServices({super.key});

  @override
  State<NetworkingServices> createState() => _NetworkingServicesState();
}

class _NetworkingServicesState extends State<NetworkingServices> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CloudData>?>(
        future: CloudDataAPI().getNetworkingData(),
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
                            children: [
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
            // } else if(snapshot.connectionState==ConnectionState.waiting){
          } else {
            return Column(
              children: List<Widget>.generate(
                  8,
                  (int index) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: 
                            FadeShimmer(
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
