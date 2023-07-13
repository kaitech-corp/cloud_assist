import 'package:flutter/material.dart';

import '../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../services/firebase_functions/firebase_functions.dart';
import '../../../services/firebase_functions/functions.dart';
import '../../../services/service_config/service_config.dart';
import '../../../services/ui/text_styles.dart';
import '../../report_dialog/report_dialog.dart';
import '../../reports/components/animated_icon_button.dart';
import 'components/button_bar.dart';
import 'components/detail_section.dart';
import 'components/list_section.dart';
import 'components/quick_fact.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key, required this.serviceData});
  final CloudData serviceData;

  @override
  Widget build(BuildContext context) {
    FirestoreDatabase().incrementPopularity(serviceData.service);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          AnimatedIconButton(Icons.auto_awesome,
              removeCloudAndWhitespace(serviceData.service)),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            child: ServiceDetailsScreen(
              serviceData: serviceData,
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
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            serviceData.service,
            style: headlineMedium(context),
          ),
          GestureDetector(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ReportDialog(
                        content: serviceData.description,
                        contentDocID: serviceData.service,
                        contentField: 'description',
                      ));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 5),
              child: Text(serviceData.description, style: titleMedium(context)),
            ),
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
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ReportDialog(
                        content: serviceData.detail,
                        contentDocID: serviceData.service,
                        contentField: 'detail',
                      ));
            },
            child: DetailSection(
              serviceData: serviceData.detail,
              section: 'Full Description',
            ),
          ),
          GestureDetector(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ReportDialog(
                        content: serviceData.example,
                        contentDocID: serviceData.service,
                        contentField: 'example',
                      ));
            },
            child: DetailSection(
              serviceData: serviceData.example,
              section: 'Example',
            ),
          ),
          ListSection(
            key: benefitsKey,
            serviceData: getUniqueValues(serviceData.benefits),
            section: 'Benefits',
            service: serviceData.service,
          ),
          ListSection(
            key: consKey,
            serviceData: getUniqueValues(serviceData.cons),
            section: 'Cons',
            service: serviceData.service,
          ),
          ListSection(
            key: useCasesKey,
            serviceData: getUniqueValues(serviceData.useCases),
            section: 'Use Cases',
            service: serviceData.service,
          ),
        ],
      ),
    );
  }
}
