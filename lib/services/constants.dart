import 'package:flutter/material.dart';

enum SelectedTabList { home, search, settings, chat, tools }

List<String> bottomNavItems = <String>[
  'Home',
  'Services',
  'GCloud',
  // 'Resources'
];
List<String> serviceDetailItems = <String>[
  'Benefits',
  'Cons',
  'Use Cases',
  'Docs'
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

List<Icon> serviceDetailIcons = const <Icon>[
  Icon(Icons.check),
  Icon(Icons.close),
  Icon(Icons.lightbulb),
  Icon(Icons.link)
];

List<String> flagTypes = <String>['Incorrect', 'Outdated'];
