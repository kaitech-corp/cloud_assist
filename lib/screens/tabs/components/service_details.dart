import 'package:flutter/material.dart';

import '../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../services/constants.dart';
import '../../../services/functions.dart';
import '../../../services/navigation/navigation.dart';
import '../../../services/service_config/service_config.dart';

import '../../../services/ui/text_styles.dart';
import '../../../widgets/service_detail_card.dart';

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
          child: SingleChildScrollView(
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
      ),
    );
  }
}

class ServiceDetailsScreen extends StatelessWidget {
  ServiceDetailsScreen({super.key, required this.serviceData});
  final CloudData serviceData;

  final GlobalKey benefitsKey = GlobalKey();
  final GlobalKey consKey = GlobalKey();
  final GlobalKey useCasesKey = GlobalKey();
  final GlobalKey exampleKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            serviceData.service,
            style: headlineSmall(context),
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
              children: <Widget>[
                Padding(
                  key: benefitsKey,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              Scrollable.ensureVisible(
                                  benefitsKey.currentContext!);
                            },
                            icon: serviceDetailIcons[0]),
                      ),
                      Text(serviceDetailItems[0])
                    ],
                  ),
                ),
                Padding(
                  key: consKey,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              Scrollable.ensureVisible(consKey.currentContext!);
                            },
                            icon: serviceDetailIcons[1]),
                      ),
                      Text(serviceDetailItems[1])
                    ],
                  ),
                ),
                Padding(
                  key: useCasesKey,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              Scrollable.ensureVisible(
                                  useCasesKey.currentContext!);
                              launchUrlFunc(serviceData.link);
                            },
                            icon: serviceDetailIcons[2]),
                      ),
                      Text(serviceDetailItems[2])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              launchUrlFunc(serviceData.link);
                            },
                            icon: serviceDetailIcons[3]),
                      ),
                      Text(serviceDetailItems[3])
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            width: SizeConfig.screenWidth,
            color: Colors.grey,
          ),
          Text('Full Description', style: titleLarge(context)),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Text(serviceData.detail, style: titleMedium(context)),
          ),
          Text('Benefits', style: titleLarge(context)),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(
                  serviceData.benefits.length,
                  (int index) => Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        child: Text(
                          '${index + 1}) ${serviceData.benefits[index]}',
                          style: titleMedium(context),
                        ),
                      )),
            ),
          ),
          Text('Cons', style: titleLarge(context)),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(
                  serviceData.cons.length,
                  (int index) => Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        child: Text(
                          '${index + 1}) ${serviceData.cons[index]}',
                          style: titleMedium(context),
                        ),
                      )),
            ),
          ),
          Text('Use Cases', style: titleLarge(context)),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(
                  serviceData.useCases.length,
                  (int index) => Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        child: Text(
                          '${index + 1}) ${serviceData.useCases[index]}',
                          style: titleMedium(context),
                        ),
                      )),
            ),
          ),
          Text('Example', style: titleLarge(context)),
          Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  serviceData.example,
                  style: titleMedium(context),
                ),
              )),
        ],
      ),
    );
  }
}
