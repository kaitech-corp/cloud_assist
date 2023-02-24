import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nil/nil.dart';

import '../../../services/constants.dart';
import '../../../services/service_config/service_config.dart';
import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../services/api/api.dart';

import '../../services/firebase_functions/functions.dart';
import '../../services/ui/text_styles.dart';
import 'components/quick_fact_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        height: SizeConfig.screenHeight,
        child: Column(
          children: <Widget>[
            const QuickFactWidget(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Quick Links', style: headlineSmall(context)),
                  // Text('View More', style: titleSmall(context))
                ],
              ),
            ),
            Container(
              height: 2,
              width: SizeConfig.screenWidth,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 10),
            SizedBox(
                height: SizeConfig.screenHeight * .06,
                width: SizeConfig.screenWidth,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(
                      quickLinks.length,
                      (int index) => Padding(
                            padding: const EdgeInsets.only(left: 16, bottom: 8),
                            child: ElevatedButton(
                                onPressed: () {
                                  // FirestoreDatabase().saveFacts();
                                  CloudDataAPI().getQuickFactData();
                                },
                                child: Text(
                                  quickLinks[index],
                                  style: titleSmall(context),
                                )),
                          )),
                )),
            Container(
              height: 2,
              width: SizeConfig.screenWidth,
              color: Colors.orangeAccent,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Featured Service', style: headlineSmall(context)),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<CloudData>?>(
                  future: CloudDataAPI().getCloudData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CloudData>?> snapshot) {
                    if (snapshot.hasData) {
                      final List<CloudData> data = snapshot.data ??
                          <CloudData>[defaultCloudData, defaultCloudData];
                      return FeaturedService(
                        cloudData: getRandomValueFromList(data) as CloudData,
                      );
                    } else {
                      return nil;
                    }
                  }),
            )
          ],
        ),
      ),
    ));
  }
}

class FeaturedService extends StatelessWidget {
  const FeaturedService({
    required this.cloudData,
    super.key,
  });

  final CloudData cloudData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.goNamed('serviceDetails', extra: cloudData);
      },
      child: SizedBox(
        height: SizeConfig.screenHeight * .2,
        width: SizeConfig.screenWidth,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
          child: SizedBox(
            height: SizeConfig.screenHeight * .15,
            width: SizeConfig.screenWidth * .8,
            child: Card(
              color: const Color(0xFFFAFAFA),
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 30,
              shadowColor: Colors.orangeAccent,
              child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                height: SizeConfig.screenHeight * .05,
                                width: SizeConfig.screenHeight * .05,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Icon(Icons.computer),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                cloudData.service,
                                style: titleMedium(context),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Text(
                            cloudData.detail,
                            style: titleSmall(context),
                          ))
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
