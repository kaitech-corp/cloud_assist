import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../services/constants.dart';
import '../services/service_config/service_config.dart';
import 'gcloud_screen.dart';
import 'home_screen.dart';
import 'resources_screen.dart';

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
    const HomeScreenData(),
    const GCloudScreen(),
    const ResourcesScreen()
  ];
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = SelectedTabList.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cloud Assist'),
        ),
        body: _widgetOptions
            .elementAt(SelectedTabList.values.indexOf(_selectedTab)),
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.transparent,
          items: List.generate(
              bottomNavItems.length,
              (int index) => Text(
                    bottomNavItems[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
          onTap: _handleIndexChanged,
          index: SelectedTabList.values.indexOf(_selectedTab),
        ));
  }
}

// bottomNavigationBar: DotNavigationBar(
// currentIndex: SelectedTabList.values.indexOf(_selectedTab),
// onTap: _handleIndexChanged,
// // dotIndicatorColor: Colors.black,
// items: <DotNavigationBarItem>[
// /// Home
// DotNavigationBarItem(
// icon: const Icon(Icons.home),
// selectedColor: Colors.purple,
// ),
//
// /// Search
// DotNavigationBarItem(
// icon: const Icon(Icons.search),
// selectedColor: Colors.pink,
// ),
//
// /// Settings
// DotNavigationBarItem(
// icon: const Icon(Icons.settings),
// selectedColor: Colors.orange,
// ),
//
// ],
// ),
