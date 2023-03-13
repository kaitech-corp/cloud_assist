import 'package:flutter/material.dart';

import '../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../services/constants.dart';
import '../../../services/firebase_functions/firebase_functions.dart';
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
                height: SizeConfig.screenHeight * .18,
                width: SizeConfig.screenWidth,
                child: FutureBuilder<String?>(
                    future: FirestoreDatabase().getFacts(serviceData.service),
                    builder: (BuildContext context,
                        AsyncSnapshot<String?> snapshot) {
                      if (snapshot.hasData) {
                        final String fact = snapshot.data!;
                        return funFactCard(Text(
                          fact,
                          style: titleMedium(context)!
                              .copyWith(color: Colors.black),
                        ));
                      } else {
                        return funFactCard(const Text('Fun Facts'));
                      }
                    })),
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
                      Text(
                        serviceDetailItems[0],
                        style: titleMedium(context),
                      )
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
                      Text(
                        serviceDetailItems[1],
                        style: titleMedium(context),
                      )
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
                      Text(
                        serviceDetailItems[2],
                        style: titleMedium(context),
                      )
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
                      Text(
                        serviceDetailItems[3],
                        style: titleMedium(context),
                      )
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
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
            ),
            child: Text('Full Description',
                style: titleLarge(context)
                    ?.copyWith(decoration: TextDecoration.underline)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Text(serviceData.detail, style: titleMedium(context)),
          ),
          Text('Benefits',
              style: titleLarge(context)
                  ?.copyWith(decoration: TextDecoration.underline)),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(
                  serviceData.benefits.length,
                  (int index) => ListTextLayout(
                        serviceData: serviceData.benefits,
                        index: index,
                      )),
            ),
          ),
          Text('Cons',
              style: titleLarge(context)
                  ?.copyWith(decoration: TextDecoration.underline)),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(
                  serviceData.cons.length,
                  (int index) => ListTextLayout(
                        serviceData: serviceData.cons,
                        index: index,
                      )),
            ),
          ),
          Text('Use Cases',
              style: titleLarge(context)
                  ?.copyWith(decoration: TextDecoration.underline)),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List<Widget>.generate(
                  serviceData.useCases.length,
                  (int index) => ListTextLayout(
                        serviceData: serviceData.useCases,
                        index: index,
                      )),
            ),
          ),
          Text('Example',
              style: titleLarge(context)
                  ?.copyWith(decoration: TextDecoration.underline)),
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

class ListTextLayout extends StatelessWidget {
  const ListTextLayout({
    super.key,
    required this.serviceData,
    required this.index,
  });

  final List<String> serviceData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${index + 1}) ',
            style: titleMedium(context),
          ),
          Flexible(
            child: Text(
              serviceData[index],
              style: titleMedium(context),
            ),
          ),
        ],
      ),
    );
  }
}
