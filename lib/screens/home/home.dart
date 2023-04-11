import 'package:cloud_functions/cloud_functions.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/generics/generic_bloc.dart';
import '../../models/cloud_data_model/cloud_data_model.dart';
import '../../models/database_architecture_model/database_architecture_model.dart';
import '../../models/quick_fact_model/quick_fact_model.dart';
import '../../repositories/cloud_data_repository.dart';
import '../../repositories/quick_facts_repository.dart';
import '../../services/constants.dart';

import '../../services/firebase_functions/cloud_functions.dart';
import '../../services/firebase_functions/firebase_functions.dart';
import '../database_comparison/database_comparison.dart';
import '../search/search_bar.dart';
import '../settings/settings.dart';
import 'home_screen.dart';

// Global fetchCount
ValueNotifier<int> fetchCount = ValueNotifier<int>(3);

/// Home Screen
class Home extends StatefulWidget {
  @override
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SelectedTabList _selectedTab = SelectedTabList.home;

  final List<Widget> _widgetOptions = <Widget>[
    BlocProvider<GenericBloc<QuickFact, QuickFactsRepository>>(
        create: (BuildContext context) =>
            GenericBloc<QuickFact, QuickFactsRepository>(
                repository: QuickFactsRepository()),
        child: const HomeScreen()),
    BlocProvider<GenericBloc<CloudData, CloudDataRepository>>(
        create: (BuildContext context) =>
            GenericBloc<CloudData, CloudDataRepository>(
                repository: CloudDataRepository()),
        child: const SearchBar()),
    FutureBuilder<Object>(
        future: CloudFunctions().getDatabaseComparisonQuestions(),
        builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
          if (snapshot.hasData) {
            final List<DatabaseArchitecture> questions =
                snapshot.data as List<DatabaseArchitecture>;
            return DatabaseComparisonScreen(
              questions: questions,
            );
          } else {
            return const DatabaseComparisonScreen(
              questions: <DatabaseArchitecture>[],
            );
          }
        }),
    const SettingsPage()
  ];
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = SelectedTabList.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: _widgetOptions
            .elementAt(SelectedTabList.values.indexOf(_selectedTab)),
        bottomNavigationBar: CurvedNavigationBar(
          color: Theme.of(context).primaryColor,
          buttonBackgroundColor: Theme.of(context).canvasColor,
          items: List<Widget>.generate(
            bottomNavItems.length,
            (int index) => bottomNavIcons[index],
          ),
          onTap: _handleIndexChanged,
          index: SelectedTabList.values.indexOf(_selectedTab),
        ));
  }
}
