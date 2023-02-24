import 'package:flutter/material.dart';

import '../../models/gcloud_data_model/gcloud_data_model.dart';
import '../../services/service_config/service_config.dart';
import '../../services/ui/text_styles.dart';

///Screen showing detail information for service provided
class GCloudDetailScreen extends StatelessWidget {
  const GCloudDetailScreen({super.key, required this.gCloudData});
  final GCloudData gCloudData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gCloudData.topic),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    gCloudData.title,
                    style: headlineSmall(context),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 2,
                  color: Colors.orangeAccent,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<Widget>.generate(
                        gCloudData.commands[0].length,
                        (int index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      gCloudData.commands
                                          .elementAt(0)
                                          .keys
                                          .elementAt(index),
                                      style: headlineSmall(context)),
                                  Text(
                                      gCloudData.commands
                                          .elementAt(0)
                                          .values
                                          .elementAt(index),
                                      style: labelMedium(context)),
                                ],
                              ),
                            )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
