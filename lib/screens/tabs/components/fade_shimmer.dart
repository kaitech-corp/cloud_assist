import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../services/service_config/service_config.dart';

Widget loadingShimmer() {
  return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 32, bottom: 32),
              child: FadeShimmer(
                height: 8,
                width: SizeConfig.screenWidth * .4,
                radius: 4,
                highlightColor: Colors.white,
                baseColor: Theme.of(context).disabledColor,
              ),
            ),
            // const SizedBox(height: 8),
            Container(height: 2, color: Colors.grey[400]),
          ],
        );
      });
}

Widget loadingReponseShimmer() {
  return ListView.builder(
    itemCount: 3,
    itemBuilder: (BuildContext context, int sectionIndex) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 32, bottom: 32),
            child: FadeShimmer(
              height: 24,
              width: SizeConfig.screenWidth * .5,
              radius: 12,
              highlightColor: Colors.white,
              baseColor: Theme.of(context).disabledColor,
            ),
          ),
          for (int i = 0; i < 4; i++)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: FadeShimmer(
                height: 8,
                width: SizeConfig.screenWidth * .8,
                radius: 4,
                highlightColor: Colors.white,
                baseColor: Theme.of(context).disabledColor,
              ),
            ),
          const SizedBox(
            height: 16,
          )
        ],
      );
    },
  );
}
