import 'package:flutter/material.dart';

import '../../../services/constants.dart';
import '../../../services/service_config/service_config.dart';
import '../../services/ui/text_styles.dart';
import 'bloc/quick_facts_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        height: SizeConfig.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const QuickFactBloc(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Quick Links', style: headlineSmall(context)),
                    Text('View More', style: titleSmall(context))
                  ],
                ),
              ),
              Container(
                height: 2,
                width: SizeConfig.screenWidth,
                color: Colors.orangeAccent,
              ),
              const SizedBox(height: 10),
              SizedBox(
                  height: SizeConfig.screenHeight * .06,
                  width: SizeConfig.screenWidth,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(
                        quickLinks.length,
                        (int index) => Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, bottom: 8),
                              child: ElevatedButton(
                                  onPressed: () {
                                    // FirestoreDatabase().saveFacts();
                                  },
                                  child: Text(
                                    quickLinks[index],
                                    style: titleSmall(context),
                                  )),
                            )),
                  )),
              Container(
                height: 2,
                width: SizeConfig.screenWidth,
                color: Colors.orangeAccent,
              ),
              Column(
                children: List<Widget>.generate(
                    3,
                    (int index) => SizedBox(
                          height: SizeConfig.screenHeight * .2,
                          width: SizeConfig.screenWidth,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 10,
                              child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: SizedBox(
                                                height:
                                                    SizeConfig.screenHeight *
                                                        .05,
                                                width: SizeConfig.screenHeight *
                                                    .05,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: const Icon(
                                                      Icons.computer),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: ListTile(
                                                title: Text(
                                                  'Service $index',
                                                  style: titleMedium(context),
                                                ),
                                                // trailing: const Icon(Icons.star),
                                                subtitle: Text(
                                                  'Random description of data',
                                                  style: titleSmall(context),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Button 1',
                                                    style: titleMedium(context),
                                                  )),
                                              ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Button 2',
                                                    style: titleMedium(context),
                                                  )),
                                            ]),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
