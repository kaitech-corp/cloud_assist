import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../services/api/api.dart';
import '../../../services/service_config/service_config.dart';
import 'quick_fact_carousel.dart';

class QuickFactWidget extends StatelessWidget {
  const QuickFactWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>?>(
        future: CloudDataAPI().getQuickFactData(),
        builder: (BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: SizeConfig.screenHeight * .15,
              width: SizeConfig.screenWidth,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: List<Flexible>.generate(3, (int index) {
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
          } else if (snapshot.hasData) {
            final List<String>? facts = snapshot.data;
            return QuickFactCarousel(
              facts: facts ?? <String>[''],
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                  height: SizeConfig.screenHeight * .15,
                  width: SizeConfig.screenWidth,
                  child: const Text('Quick Fact')),
            );
          }
        });
  }
}
