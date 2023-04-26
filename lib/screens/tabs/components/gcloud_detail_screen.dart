import 'package:flutter/material.dart';

import '../../../models/gcloud_data_model/gcloud_data_model.dart';
import '../../../services/constants.dart';
import '../../../services/firebase_functions/firebase_functions.dart';
import '../../../services/navigation/navigation.dart';
import '../../../services/service_config/service_config.dart';
import '../../../services/ui/text_styles.dart';
import '../../../widgets/line_break.dart';
import '../../../widgets/service_detail_card.dart';

///Screen showing detail information for service provided
class GCloudDetailScreen extends StatelessWidget {
  const GCloudDetailScreen({super.key, required this.gCloudData});
  final GCloudData gCloudData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            router.pop();
            RealTimeDatabase().saveUserInteraction(
                serviceId: gCloudData.topic,
                featureId: FeatureID.commandlines.toString(),
                startTime: false,
                endTime: true);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Command Lines',
          style: headlineMedium(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      gCloudData.topic,
                      style: headlineSmall(context),
                    ),
                    Text(
                      gCloudData.title,
                      style: titleMedium(context),
                    ),
                    Container(
                      height: 2,
                      width: SizeConfig.screenWidth,
                      color: Colors.grey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List<Widget>.generate(
                          gCloudData.commands.length,
                          (int index) => Padding(
                                padding: const EdgeInsets.fromLTRB(8, 24, 8, 16),
                                child: GestureDetector(
                                  onTap: () {
                                    RealTimeDatabase().saveUserInteraction(
                                        serviceId: gCloudData.commands.keys
                                            .elementAt(index),
                                        featureId:
                                            FeatureID.commandlines.toString(),
                                        startTime: true,
                                        endTime: false);
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      terminalView(
                                          gCloudData.commands.keys.elementAt(index),
                                          ),
                                          const SizedBox(height: 8,),
                                          Text(gCloudData.commands.values
                                          .elementAt(index),style: titleSmall(context),),
                                          greyLineBreak
                                    ],
                                  ),
                                ),
                              )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
