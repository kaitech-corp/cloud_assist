import 'package:flutter/material.dart';

import '../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../services/navigation/navigation.dart';
import '../../../services/service_config/service_config.dart';
import '../../../services/ui/text_styles.dart';
import 'components/button_bar.dart';
import 'components/detail_section.dart';
import 'components/list_section.dart';
import 'components/quick_fact.dart';

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
            style: headlineMedium(context),
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
          QuickFact(serviceData: serviceData),
          SizedBox(height: SizeConfig.screenHeight * .05),
          ServiceDetailItemsRow(
            benefitsKey: benefitsKey,
            consKey: consKey,
            useCasesKey: useCasesKey,
            serviceData: serviceData,
          ),
          Container(
            height: 2,
            width: SizeConfig.screenWidth,
            color: Colors.grey,
          ),
          DetailSection(
            serviceData: serviceData.detail,
            section: 'Full Description',
          ),
          DetailSection(
            serviceData: serviceData.detail,
            section: 'Example',
          ),
          ListSection(key: benefitsKey, serviceData: serviceData.benefits, section: 'Benefits'),
          ListSection(key: consKey, serviceData: serviceData.cons, section: 'Cons'),
          ListSection(key: useCasesKey, serviceData: serviceData.useCases, section: 'Use Cases'),
        ],
      ),
    );
  }
}
