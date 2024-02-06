import 'package:flutter/material.dart';

import '../../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../../services/constants.dart';
import '../../../../services/firebase_functions/firebase_functions.dart';
import '../../../../services/firebase_functions/functions.dart';
import '../../../../services/service_config/service_config.dart';
import '../../../../services/ui/text_styles.dart';

class ServiceDetailItemsRow extends StatelessWidget {
  const ServiceDetailItemsRow({
    super.key,
    required this.benefitsKey,
    required this.consKey,
    required this.useCasesKey,
    required this.serviceData,
  });

  final GlobalKey benefitsKey;
  final GlobalKey consKey;
  final GlobalKey useCasesKey;
  final CloudData serviceData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * .1,
      width: SizeConfig.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ServiceDetailItem(
            onPressed: () {
              Scrollable.ensureVisible(benefitsKey.currentContext!);
              FirestoreDatabase().saveUserInteraction(
                  serviceId: serviceData.service,
                  featureId: FeatureID.benefits.toString(),
                  startTime: true,
                  endTime: false);
            },
            icon: serviceDetailIcons[0],
            label: serviceDetailItems[0],
          ),
          ServiceDetailItem(
            onPressed: () {
              Scrollable.ensureVisible(consKey.currentContext!);
              FirestoreDatabase().saveUserInteraction(
                  serviceId: serviceData.service,
                  featureId: FeatureID.cons.toString(),
                  startTime: true,
                  endTime: false);
            },
            icon: serviceDetailIcons[1],
            label: serviceDetailItems[1],
          ),
          ServiceDetailItem(
            onPressed: () {
              Scrollable.ensureVisible(useCasesKey.currentContext!);
              FirestoreDatabase().saveUserInteraction(
                  serviceId: serviceData.service,
                  featureId: FeatureID.use_cases.toString(),
                  startTime: true,
                  endTime: false);
            },
            icon: serviceDetailIcons[2],
            label: serviceDetailItems[2],
          ),
          ServiceDetailItem(
            onPressed: () {
              launchUrlFunc(serviceData.link);
              FirestoreDatabase().saveUserInteraction(
                  serviceId: serviceData.service,
                  featureId: FeatureID.docs.toString(),
                  startTime: true,
                  endTime: false);
            },
            icon: serviceDetailIcons[3],
            label: serviceDetailItems[3],
          ),
        ],
      ),
    );
  }
}

class ServiceDetailItem extends StatelessWidget {
  const ServiceDetailItem({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  final VoidCallback onPressed;
  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: CircleAvatar(
                child: IconButton(onPressed: onPressed, icon: icon),
              ),
            ),
            Expanded(
              child: Text(
                label,
                style: titleMedium(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
