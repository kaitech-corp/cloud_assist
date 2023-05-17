import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/service_config/service_config.dart';
import '../../bloc/generics/generic_bloc.dart';
import '../../bloc/generics/generic_state.dart';
import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../repositories/cloud_data_repository.dart';
import '../../services/constants.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../../services/navigation/navigation.dart';
import '../../services/ui/text_styles.dart';
import '../../widgets/line_break.dart';
import '../tabs/command_lines.dart';
import '../tabs/databases.dart';
import '../tabs/networking.dart';
import '../tabs/security.dart';
import '../tabs/services.dart';

import 'components/featured_service/featured_service.dart';
import 'components/quick_fact_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GenericBloc<CloudData, CloudDataRepository> bloc;

  @override
  void initState() {
    bloc =
        BlocProvider.of<GenericBloc<CloudData, CloudDataRepository>>(context);
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Cloud Assist',
                  style: headlineMedium(context),
                ),
              ),
              Expanded(child: BlocBuilder<
                      GenericBloc<CloudData, CloudDataRepository>,
                      GenericState>(
                        bloc: bloc,
                  builder: (BuildContext context, GenericState state) {
                if (state is HasDataState) {
                  final List<CloudData> cloudData =
                      state.data as List<CloudData>;
                  return TabControllerWidget(
                    cloudData: cloudData,
                  );
                } else {
                  return const TabControllerWidget(cloudData: <CloudData>[]);
                }
              })),
            ],
          ),
        ),
      ),
    );
  }
}

class TabControllerWidget extends StatelessWidget {
  const TabControllerWidget({super.key, required this.cloudData});
  final List<CloudData> cloudData;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: List<Widget>.generate(
                  tabs.length, (int index) => Text(tabs[index])),
              isScrollable: true,
              labelStyle: titleMedium(context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(height: 2, color: Colors.grey),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                       const Expanded(
                        flex: 3,
                        child: QuickFactWidget()),
                      Column(
                        children: <Widget>[
                          greyLineBreak,
                          SizedBox(
                              height: SizeConfig.screenHeight * .055,
                              width: SizeConfig.screenWidth,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List<Widget>.generate(
                                    quickLinks.length,
                                    (int index) => Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, left: 16, bottom: 8),
                                          child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(
                                                      color: Color(-3092272))),
                                              onPressed: () {
                                                switch (index) {
                                                  case 0:
                                                    FirestoreDatabase()
                                                        .saveUserInteraction(
                                                            featureId: FeatureID
                                                                .databaseSolutions
                                                                .toString(),
                                                            startTime: true,
                                                            endTime: false);
                                                    router.goNamed('solutions');
                                                    break;
                                                  case 1:
                                                    FirestoreDatabase()
                                                        .saveUserInteraction(
                                                            featureId: FeatureID
                                                                .generatedContent
                                                                .toString(),
                                                            startTime: true,
                                                            endTime: false);
                                                    router.goNamed('reports');
                                                    break;
                                                  // case 2:
                                                  //   router.goNamed('resources');
                                                  //   break;
                                                  default:
                                                    // Do nothing or show an error message
                                                    break;
                                                }
                                              },
                                              child: Text(quickLinks[index],
                                                  style: titleSmall(context))),
                                        )),
                              )),
                          greyLineBreak
                        ],
                      ),
                      const Expanded(flex: 4, child: FeaturedService())
                    ],
                  ),
                  PopularServices(
                    cloudData: cloudData,
                  ),
                   DatabaseServices(cloudData: cloudData,),
                   NetworkingServices(cloudData: cloudData,),
                   SecurityServices(cloudData: cloudData,),
                  const GCloudScreen(),
                ],
              ),
            )
          ],
        ));
  }
}
