import 'package:flutter/material.dart';

import '../../../../models/cloud_data_model/cloud_data_model.dart';
import '../../../../services/constants.dart';
import '../../../../services/firebase_functions/firebase_functions.dart';
import '../../../../services/firebase_functions/functions.dart';
import '../../../../services/service_config/service_config.dart';
import '../../../../services/ui/text_styles.dart';
import '../../../../widgets/service_detail_card.dart';

class QuickFact extends StatefulWidget {
  const QuickFact({
    super.key,
    required this.serviceData,
  });

  final CloudData serviceData;

  @override
  QuickFactState createState() => QuickFactState();
}

class QuickFactState extends State<QuickFact> {
  String? _fact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: SizedBox(
        height: SizeConfig.tablet
            ? SizeConfig.screenHeight * .2
            : SizeConfig.screenHeight * .24,
        width: SizeConfig.screenWidth,
        child: FutureBuilder<List<String?>?>(
          future: FirestoreDatabase().getFacts(widget.serviceData.service),
          builder:
              (BuildContext context, AsyncSnapshot<List<String?>?> snapshot) {
            if (snapshot.hasData) {
              final List<String?> facts = snapshot.data!;
              _fact = getRandomValueFromList(facts) as String;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _fact = getRandomValueFromList(facts) as String;
                  });
                  FirestoreDatabase().saveUserInteraction(
                      serviceId: widget.serviceData.service,
                      featureId: FeatureID.quickFact.toString(),
                      startTime: true,
                      endTime: false);
                },
                child: funFactCard(
                  Text(
                    _fact ?? 'Fun Facts',
                    softWrap: true,
                    style: titleMedium(context)!.copyWith(color: Colors.black),
                  ),
                ),
              );
            } else {
              return funFactCard(Text(
                'Fun Facts',
                style: titleMedium(context),
              ));
            }
          },
        ),
      ),
    );
  }
}
