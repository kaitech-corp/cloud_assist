import 'package:flutter/material.dart';

import '../../../models/gcloud_data_model/gcloud_data_model.dart';
import '../../../services/navigation/navigation.dart';
import '../../../services/service_config/service_config.dart';
import '../../../services/ui/text_styles.dart';
import '../../../widgets/service_detail_card.dart';

///Screen showing detail information for service provided
class GCloudDetailScreen extends StatelessWidget {
  const GCloudDetailScreen({super.key, required this.gCloudData});
  final GCloudData gCloudData;

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
              IconButton(
                  onPressed: router.pop,
                  icon: const Icon(Icons.arrow_back_ios)),
              Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                padding: const EdgeInsets.all(8.0),
                                child: terminalView(
                                    gCloudData.commands.keys.elementAt(index),
                                    gCloudData.commands.values
                                        .elementAt(index)),
                              )),)
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
