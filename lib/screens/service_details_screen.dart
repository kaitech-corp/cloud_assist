import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../models/cloud_data_model.dart';
import '../services/constants.dart';
import '../services/functions.dart';
import '../services/navigation/navigation.dart';
import '../services/service_config/service_config.dart';
import '../services/text_styles.dart';
import '../widgets/service_detail_card.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({super.key, required this.serviceData});
  final CloudData serviceData;
  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    final List<List<String>> serviceDataList = <List<String>>[
      widget.serviceData.benefits,
      widget.serviceData.cons,
      widget.serviceData.useCases
    ];
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        router.pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios))
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          widget.serviceData.service,
                          style: headline4(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(widget.serviceData.description,
                            style: subtitle1(context)),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * .05),
                      Text('Full Description', style: headline6(context)),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ReadMoreText(
                          widget.serviceData.detail,
                          trimMode: TrimMode.Line,
                          trimLines: 2,
                          trimCollapsedText: 'More',
                          trimExpandedText: 'Less',
                          style: subtitle1(context),
                          colorClickableText: Colors.pinkAccent,
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * .05),
                      SizedBox(
                        height: SizeConfig.screenHeight * .1,
                        width: SizeConfig.screenWidth,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List<Widget>.generate(
                                serviceDetailItems.length,
                                (int index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          CircleAvatar(
                                            child: IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          ServiceDetailsBottomSheet(
                                                              index: index,
                                                              data:
                                                                  serviceDataList[
                                                                      index]),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)));
                                                },
                                                icon:
                                                    serviceDetailIcons[index]),
                                          ),
                                          Text(serviceDetailItems[index])
                                        ],
                                      ),
                                    ))),
                      ),
                      SizedBox(
                          height: SizeConfig.screenHeight * .15,
                          width: SizeConfig.screenWidth,
                          child: funFactCard(const Text('Fun Facts'))),
                      Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                                onPressed: () {
                                  launchUrlFunc(widget.serviceData.link);
                                },
                                child: Text(
                                  'Learn More',
                                  style: subtitle1(context),
                                ))),   ), ],  ), ),  ) ],  )),));}}

class ServiceDetailsBottomSheet extends StatelessWidget {
  const ServiceDetailsBottomSheet(
      {super.key, required this.data, required this.index});
  final List<String> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            serviceDetailItems[index],
            style: headline4(context),
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: List<Widget>.generate(
                  data.length,
                  (int index) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: card(Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data[index],
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        )),
                      )),
            ),
          ),
        ),
      ],
    );
  }
}
