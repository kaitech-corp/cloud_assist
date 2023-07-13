import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

import '../../../services/constants.dart';
import '../../../services/firebase_functions/cloud_functions.dart';
import '../../../services/firebase_functions/functions.dart';
import '../../../services/service_config/service_config.dart';
import 'quick_fact_carousel.dart';

class QuickFactWidget extends StatelessWidget {
  const QuickFactWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>?>(
        future: CloudFunctions().getFactsData(),
        builder: (BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: SizeConfig.screenHeight * .15,
              width: SizeConfig.screenWidth,
              child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                          ),
                          child: FadeShimmer(
                            width: SizeConfig.screenWidth,
                            height: 8,
                            radius: 4,
                            highlightColor: Colors.white,
                            baseColor: Theme.of(context).disabledColor,
                          ),
                        );
                      })),
            );
          } else if (snapshot.hasData) {
            final List<String>? facts = snapshot.data;
            final int idx = randomIndex(facts ?? <String>[]);
            List<String> quickFacts = <String>[];

            if ((facts?.length ?? 0) < 3) {
              quickFacts = defaultQuickFacts;
            } else {
              quickFacts = facts?.sublist(idx, idx + 3) ?? <String>[];
            }
            return QuickFactCarousel(facts: quickFacts);
          } else {
            return QuickFactCarousel(facts: defaultQuickFacts);
          }
        });
  }
}
