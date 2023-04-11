import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../../services/firebase_functions/cloud_functions.dart';
import '../../../../services/firebase_functions/functions.dart';
import '../../../../services/service_config/service_config.dart';
import '../../../../services/ui/text_styles.dart';
import '../../../../widgets/line_break.dart';
import 'featured_service.dart';

class FeaturedServiceWidget extends HookWidget {
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
              Text('FEATURED SERVICES', style: titleMedium(context)),
            ],
          ),
        ),
        Expanded(
          child: useMemoized(() {
            return FutureBuilder<List<CloudData>?>(
              future: CloudFunctions().getCombinedCloudData(),
              builder: (BuildContext context, AsyncSnapshot<List<CloudData>?> snapshot) {
                if (snapshot.hasData) {
                  final List<CloudData> data = snapshot.data ?? <CloudData>[defaultCloudData, defaultCloudData];
                  final List<CloudData> uniqueServices = getUniqueValues(data) as List<CloudData>;
                  return SingleChildScrollView(
                    child: Column(
                      children: List<Widget>.generate(
                        uniqueServices.length,
                        (int index) {
                          return Column(
                            children: <Widget>[
                              FeaturedService(
                                cloudData: uniqueServices[index],
                              ),
                              greyLineBreak
                            ],
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return Column(
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
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
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
                                        baseColor: Theme.of(context)
                                            .disabledColor,
                                      ),
                                      FadeShimmer.round(
                                        size: SizeConfig.screenWidth * .05,
                                        highlightColor: Colors.white,
                                        baseColor: Theme.of(context)
                                            .disabledColor,
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
                                    baseColor: Theme.of(context)
                                        .disabledColor,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenWidth * .05,
                                  ),
                                  FadeShimmer(
                                    height: 8,
                                    width: SizeConfig.screenWidth,
                                    radius: 4,
                                    highlightColor: Colors.white,
                                    baseColor: Theme.of(context)
                                        .disabledColor,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenWidth * .05,
                                  ),
                                ],
                              ),
                            ),
                            greyLineBreak
                          ],
                        ),
                      );
                    }),
                  );
                }
              },
            );
          }),
        ),
      ],
    );
  }
}
