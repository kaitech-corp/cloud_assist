import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:nil/nil.dart';

import '../models/cloud_data_model.dart';
import '../services/service_config/service_config.dart';
import '../widgets/service_detail_card.dart';

///Screen showing detail information for service provided
class ServiceDetail extends StatelessWidget {
  const ServiceDetail({super.key, required this.serviceData});
  final CloudData serviceData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceData.service),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: serviceDetailCard(Text(
                  serviceData.description,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: serviceDetailCard(
                  ExpandablePanel(
                      header: Center(
                          child: Text(
                        'Detailed Description',
                        style: Theme.of(context).textTheme.headline6,
                      )),
                      collapsed: nil,
                      expanded: Text(
                        serviceData.detail,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: serviceDetailCard(
                  ExpandablePanel(
                    header: Center(
                        child: Text(
                      'Benefits',
                      style: Theme.of(context).textTheme.headline6,
                    )),
                    collapsed: nil,
                    expanded: Column(
                      children: List<Widget>.generate(
                          serviceData.benefits.length,
                          (int index) => Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  '${index + 1}. ${serviceData.benefits[index]}',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: serviceDetailCard(
                  ExpandablePanel(
                    header: Center(
                        child: Text(
                      'Cons',
                      style: Theme.of(context).textTheme.headline6,
                    )),
                    collapsed: nil,
                    expanded: Column(
                      children: List.generate(
                          serviceData.cons.length,
                          (int index) => Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  '${index + 1}. ${serviceData.cons[index].replaceAll("\u0027", "'")}',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: serviceDetailCard(
                  ExpandablePanel(
                    header: Center(
                        child: Text(
                      'Use Cases',
                      style: Theme.of(context).textTheme.headline6,
                    )),
                    collapsed: nil,
                    expanded: Column(
                      children: List<Widget>.generate(
                          serviceData.useCases.length,
                          (int index) => Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  '${index + 1}. ${serviceData.useCases[index]}',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: serviceDetailCard(
                  ExpandablePanel(
                      header: Center(
                          child: Text(
                        'Example',
                        style: Theme.of(context).textTheme.headline6,
                      )),
                      collapsed: nil,
                      expanded: Text(
                        serviceData.example,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
