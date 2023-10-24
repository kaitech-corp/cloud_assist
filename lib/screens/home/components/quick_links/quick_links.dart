import 'package:flutter/material.dart';

import '../../../../services/constants.dart';
import '../../../../services/firebase_functions/firebase_functions.dart';
import '../../../../services/navigation/navigation.dart';
import '../../../../services/service_config/service_config.dart';
import '../../../../services/ui/text_styles.dart';
import '../../../../widgets/line_break.dart';

class QuickLinks extends StatelessWidget {
  const QuickLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        greyLineBreak,
        SizedBox(
            height: SizeConfig.screenHeight * .075,
            width: SizeConfig.screenWidth,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List<Widget>.generate(
                  // quickLinks.length,
                  2,
                  (int index) => Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 16, bottom: 8),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(-3092272))),
                            onPressed: () {
                              switch (index) {
                                case 0:
                                  FirestoreDatabase().saveUserInteraction(
                                      featureId: FeatureID.databaseSolutions
                                          .toString(),
                                      startTime: true,
                                      endTime: false);
                                  router.goNamed('solutions');
                                  break;
                                case 1:
                                  FirestoreDatabase().saveUserInteraction(
                                      featureId:
                                          FeatureID.generatedContent.toString(),
                                      startTime: true,
                                      endTime: false);
                                  router.goNamed('reports');
                                  break;
                                // case 2:
                                //   router.goNamed('resources');
                                //   break;
                                default:
                                  // Do nothing or show an error message
                                  break;
                              }
                            },
                            child: Text(quickLinks[index],
                                style: titleSmall(context))),
                      )),
            )),
        greyLineBreak,
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: TextButton(
        //     onPressed: () {
        //       router.goNamed('linkList');
        //     },
        //     child: Text('View All', style: titleSmall(context)?.copyWith(color: Colors.blueAccent)),
        //   ),
        // ),
      ],
    );
  }
}
