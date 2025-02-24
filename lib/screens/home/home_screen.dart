import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/generics/generic_bloc.dart';
import '../../bloc/generics/generic_state.dart';
import '../../bloc/generics/generics_event.dart';
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
    bloc.add(LoadingGenericData());
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header text
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: Text(
                'Cloud Assist',
                style: headlineMedium(context),
              ),
            ),
            const SizedBox(height: 8.0),
            // Expanded area for the main content
            Expanded(
              child: BlocBuilder<GenericBloc<CloudData, CloudDataRepository>,
                  GenericState>(
                bloc: bloc,
                builder: (BuildContext context, GenericState state) {
                  if (state is HasDataState) {
                    final List<CloudData> cloudData =
                        state.data as List<CloudData>;
                    return TabControllerWidget(cloudData: cloudData);
                  } else {
                    return const TabControllerWidget(cloudData: <CloudData>[]);
                  }
                },
              ),
            ),
          ],
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
          // Tab bar (scrollable if needed)
          TabBar(
            tabs:
                List<Widget>.generate(5, (int index) => Tab(text: tabs[index])),
            isScrollable: true,
            indicatorColor: Theme.of(context).colorScheme.secondary,
            labelColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelColor: Theme.of(context).textTheme.bodyMedium?.color,
            labelStyle: titleMedium(context),
            labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
          const SizedBox(height: 16.0),
          Container(height: 2, color: Colors.grey),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                const SingleChildScrollView(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      QuickFactWidget(),
                      SizedBox(height: 16.0),
                      QuickLinks(),
                      SizedBox(height: 16.0),
                      FeaturedService(),
                    ],
                  ),
                ),
                // Other tabs
                PopularServices(cloudData: cloudData),
                AWSServices(cloudData: cloudData),
                GCPServices(cloudData: cloudData),
                const GCloudScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
