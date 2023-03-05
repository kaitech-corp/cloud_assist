import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../services/api/api.dart';
import '../../../services/firebase_functions/functions.dart';
import '../../../services/service_config/service_config.dart';
import '../../../services/ui/text_styles.dart';
import 'featured_service.dart';

class FeaturedServiceWidget extends StatelessWidget {
  const FeaturedServiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Featured Services', style: headlineSmall(context)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(height: 2, color: Colors.grey),
        ),
        FutureBuilder<List<CloudData>?>(
            future: CloudDataAPI().getCloudData(),
            builder: (BuildContext context,
                AsyncSnapshot<List<CloudData>?> snapshot) {
              if (snapshot.hasData) {
                return buildFeaturedServices(
                    context,
                    snapshot.data ??
                        <CloudData>[defaultCloudData, defaultCloudData]);
              } else {
                return Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: List<Flexible>.generate(6, (int index) {
                          return Flexible(
                            child: ListTile(
                              title: FadeShimmer(
                                height: 2,
                                width: SizeConfig.screenWidth,
                                radius: 2,
                                highlightColor: Colors.grey.shade600,
                                baseColor: const Color(0xffE6E8EB),
                              ),
                            ),
                          );
                        }),
                      )),
                );
              }
            }),
      ],
    );
  }

  Widget buildFeaturedServices(BuildContext context, List<CloudData> data) {
    return Column(
      children: <Widget>[
        FeaturedService(
          cloudData: getRandomValueFromList(data) as CloudData,
        ),
        Container(height: 2, color: Colors.grey[400]),
        FeaturedService(
          cloudData: getRandomValueFromList(data) as CloudData,
        ),
        Container(height: 2, color: Colors.grey[400]),
        FeaturedService(
          cloudData: getRandomValueFromList(data) as CloudData,
        ),
      ],
    );
  }
}
