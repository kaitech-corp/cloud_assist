import 'package:flutter/material.dart';

import '../models/gcloud_data_model/gcloud_data_model.dart';
import '../services/service_config/service_config.dart';

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
                  style: Theme.of(context).textTheme.headline5,

                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(
                      gCloudData.commands[0].length,
                          (int index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              gCloudData.commands.elementAt(0).keys.elementAt(index), style: Theme.of(context).textTheme.headline6,),
                            Text(
                              'Description: ${gCloudData.commands.elementAt(0).values.elementAt(index)}',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      )),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
