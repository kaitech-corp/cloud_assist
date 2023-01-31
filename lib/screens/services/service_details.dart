import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../services/constants.dart';
import '../../services/functions.dart';
import '../../services/navigation/navigation.dart';
import '../../services/service_config/service_config.dart';

import '../../services/ui/text_styles.dart';
import '../../widgets/service_detail_card.dart';
import 'components/service_details_bottom_sheet.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key, required this.serviceData});
  final CloudData serviceData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        router.pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios))
                ],
              ),
              ServiceDetailsScreen(
                serviceData: serviceData,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key, required this.serviceData});
  final CloudData serviceData;
  @override
  Widget build(BuildContext context) {
    final List<List<String>> serviceDataList = <List<String>>[
      serviceData.benefits,
      serviceData.cons,
      serviceData.useCases
    ];
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              serviceData.service,
              style: headlineLarge(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 5),
              child: Text(serviceData.description, style: titleMedium(context)),
            ),
            Container(
              height: 2,
              width: SizeConfig.screenWidth,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: SizedBox(
                  height: SizeConfig.screenHeight * .15,
                  width: SizeConfig.screenWidth,
                  child: funFactCard(const Text('Fun Facts'))),
            ),
            SizedBox(height: SizeConfig.screenHeight * .05),
            SizedBox(
              height: SizeConfig.screenHeight * .1,
              width: SizeConfig.screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List<Widget>.generate(
                    serviceDetailItems.length,
                    (int index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                child: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              ServiceDetailsBottomSheet(
                                                  index: index,
                                                  data: serviceDataList[index]),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)));
                                    },
                                    icon: serviceDetailIcons[index]),
                              ),
                              Text(serviceDetailItems[index])
                            ],
                          ),
                        )),
              ),
            ),
            Container(
              height: 2,
              width: SizeConfig.screenWidth,
              color: Colors.grey,
            ),
            Text('Full Description', style: headlineSmall(context)),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ReadMoreText(
                serviceData.detail,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'More',
                trimExpandedText: 'Less',
                style: titleMedium(context),
                colorClickableText: Colors.pinkAccent,
              ),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {
                        launchUrlFunc(serviceData.link);
                      },
                      child: Text('Learn More', style: titleMedium(context)))),
            ),
          ],
        ),
      ),
    );
  }
}
