import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../models/gcloud_data_model/gcloud_data_model.dart';
import '../services/api/api.dart';
import '../services/service_config/service_config.dart';
import '../widgets/service_detail_card.dart';

class GCloudScreen extends StatelessWidget {
  const GCloudScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GCloudData>?>(
        future: CloudDataAPI().getGCloudData(),
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
                          context.goNamed('gcloud',extra: gCloudData);
                        },
                        child: card(Text(
                          gCloudData.topic,
                          style: Theme.of(context).textTheme.headline5,
                          textAlign: TextAlign.center,
                        ))),
                  );
                });
            // } else if(snapshot.connectionState==ConnectionState.waiting){
          } else {
            return Column(
              children: List.generate(
                  8,
                  (int index) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: card(
                            FadeShimmer(
                              height: 8,
                              width: SizeConfig.screenWidth,
                              radius: 4,
                              highlightColor: const Color(0xffF9F9FB),
                              baseColor: const Color(0xffE6E8EB),
                            ),
                          ),
                        ),
                      )),
            );
          }
        });
  }
}
