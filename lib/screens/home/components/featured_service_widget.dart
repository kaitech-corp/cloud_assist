import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../services/firebase_functions/cloud_functions.dart';
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
            future: CloudFunctions().getCombinedCloudData(),
            builder: (BuildContext context,
                AsyncSnapshot<List<CloudData>?> snapshot) {
              if (snapshot.hasData) {
                return buildFeaturedServices(
                    context,
                    snapshot.data ??
                        <CloudData>[defaultCloudData, defaultCloudData]);
              } else {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<Flexible>.generate(3, (int index) {
                      return Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24.0, top: 16.0, right: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      FadeShimmer(
                                        height: 8,
                                        width: SizeConfig.screenWidth * .2,
                                        radius: 4,
                                        highlightColor: Colors.white,
                                        baseColor:
                                            Theme.of(context).disabledColor,
                                      ),
                                      FadeShimmer.round(
                                        size: SizeConfig.screenWidth * .05,
                                        highlightColor: Colors.white,
                                        baseColor:
                                            Theme.of(context).disabledColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenWidth * .05,
                                  ),
                                  FadeShimmer(
                                    height: 8,
                                    width: SizeConfig.screenWidth,
                                    radius: 4,
                                    highlightColor: Colors.white,
                                    baseColor: Theme.of(context).disabledColor,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenWidth * .05,
                                  ),
                                  FadeShimmer(
                                    height: 8,
                                    width: SizeConfig.screenWidth,
                                    radius: 4,
                                    highlightColor: Colors.white,
                                    baseColor: Theme.of(context).disabledColor,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenWidth * .05,
                                  ),
                                ],
                              ),
                            ),
                            Container(height: 2, color: Colors.grey[400]),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              }
            }),
      ],
    );
  }

  Widget buildFeaturedServices(BuildContext context, List<CloudData> data) {
    final List<CloudData> uniqueServices =
        getUniqueValues(data) as List<CloudData>;
    return Column(
        children: List<Widget>.generate(
      uniqueServices.length,
      (int index) {
        return Column(
          children: <Widget>[
            FeaturedService(
              cloudData: uniqueServices[index],
            ),
            Container(height: 2, color: Colors.grey[400]),
          ],
        );
      },
    ));
  }
}