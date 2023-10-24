import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/service_config/service_config.dart';
import '../../bloc/generics/generic_bloc.dart';
import '../../bloc/generics/generic_state.dart';
import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../repositories/cloud_data_repository.dart';
import '../../services/constants.dart';
import '../../services/ui/text_styles.dart';
import '../tabs/aws.dart';
import '../tabs/command_lines.dart';
import '../tabs/gcp.dart';
import '../tabs/services.dart';
import 'components/featured_service/featured_service.dart';
import 'components/quick_fact/quick_fact_widget.dart';
import 'components/quick_links/quick_links.dart';

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
              Expanded(
                  child: BlocBuilder<
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
                          return const TabControllerWidget(
                              cloudData: <CloudData>[]);
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
        length: 5,
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: List<Widget>.generate(5, (int index) => Text(tabs[index])),
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
                  const Column(
                    children: <Widget>[
                      Expanded(flex: 3, child: QuickFactWidget()),
                      QuickLinks(),
                      Expanded(flex: 3, child: FeaturedService())
                    ],
                  ),
                  PopularServices(
                    cloudData: cloudData,
                  ),
                  AWSServices(cloudData: cloudData),
                  GCPServices(
                    cloudData: cloudData,
                  ),
                  const GCloudScreen()
                ],
              ),
            )
          ],
        ));
  }
}
