import 'package:flutter/material.dart';

import '../../../services/service_config/service_config.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/navigation/navigation.dart';
import '../../services/ui/text_styles.dart';
import '../../widgets/line_break.dart';
import '../tabs/command_lines.dart';
import '../tabs/databases.dart';
import '../tabs/networking.dart';
import '../tabs/security.dart';
import '../tabs/services.dart';
import 'components/featured_service/featured_service_widget.dart';
import 'components/quick_fact_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Cloud Assist',
                  style: headlineMedium(context),
                ),
              ),
              const Expanded(child: TabControllerWidget()),
            ],
          ),
        ),
      ),
    );
  }
}

class TabControllerWidget extends StatelessWidget {
  const TabControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: List<Widget>.generate(
                  tabs.length, (int index) => Text(tabs[index])),
              isScrollable: true,
              labelStyle: titleMedium(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(height: 2, color: Colors.grey),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Expanded(child: QuickFactWidget()),
                      Column(
                        children: <Widget>[
                          greyLineBreak,
                          SizedBox(
                              height: SizeConfig.screenHeight * .055,
                              width: SizeConfig.screenWidth,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List<Widget>.generate(
                                    quickLinks.length,
                                    (int index) => Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, left: 16, bottom: 8),
                                          child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(
                                                      color: Color(-3092272))),
                                              onPressed: () {
                                                switch (index) {
                                                  case 0:
                                                    RealTimeDatabase()
                                                        .saveUserInteraction(
                                                            featureId: FeatureID
                                                                .databaseSolutions
                                                                .toString(),
                                                            startTime: true,
                                                            endTime: false);
                                                    router.goNamed('solutions');
                                                    break;
                                                  case 1:
                                                    RealTimeDatabase()
                                                        .saveUserInteraction(
                                                            featureId: FeatureID
                                                                .generatedContent
                                                                .toString(),
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
                          greyLineBreak
                        ],
                      ),
                      const Expanded(flex: 2, child: FeaturedServiceWidget())
                    ],
                  ),
                  const PopularServices(),
                  const DatabaseServices(),
                  const NetworkingServices(),
                  const SecurityServices(),
                  const GCloudScreen(),
                ],
              ),
            )
          ],
        ));
  }
}
