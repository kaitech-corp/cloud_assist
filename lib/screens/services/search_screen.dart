import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../services/api/api.dart';
import '../../services/service_config/service_config.dart';
import '../../widgets/service_detail_card.dart';

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
        future: CloudDataAPI().getCloudData(),
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
                        child: card(Text(
                          cloudData.service,
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ))),
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
