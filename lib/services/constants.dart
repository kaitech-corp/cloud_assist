import 'package:flutter/material.dart';

enum SelectedTabList { home, search, settings, chat, tools }

List<String> bottomNavItems = <String>[
  'Home',
  'Services',
  'GCloud',
  'Resources'
];
List<String> serviceDetailItems = <String>[
  'Benefits',
  'Cons',
  'Use Cases',
];
List<String> quickLinks = <String>[
  'Database Comparison',
  'Networking',
  'Case Studios',
];
List<Icon> bottomNavIcons = const <Icon>[
  Icon(Icons.home),
  Icon(Icons.search),
  Icon(Icons.computer_sharp),
  Icon(Icons.list)
];

List<String> quickLinkItems = <String>['Quick Link 1','Quick Link 2','Quick Link 3','Quick Link 4','Quick Link 5'];


List<Icon> serviceDetailIcons = const <Icon>[
  Icon(Icons.check),
  Icon(Icons.close),
  Icon(Icons.lightbulb),
];