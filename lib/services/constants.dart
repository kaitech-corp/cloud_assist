import 'package:flutter/material.dart';

enum SelectedTabList { home, search, database, settings }

enum FeatureID {
  home,
  search,
  database,
  settings,
  popularServices,
  data,
  networking,
  security,
  commandlines,
  databaseSolutions,
  generatedContent,
  featuredServices,
  quickFact,
  benefits,
  cons,
  use_cases,
  docs,
  generatedSolution,
  signout,
  googleSignin,
  appleSignin,
  like,
  deleteAccount
}

List<String> bottomNavItems = <String>[
  'Home',
  'Services',
  'Database',
  'Settings'
];

List<String> tabs = <String>[
  'Home',
  'Popular Services',
  'AI',
  'Data',
  'Networking',
  'Security',
  'GCloud'
];
List<String> serviceDetailItems = <String>[
  'Benefits',
  'Cons',
  'Use Cases',
  'Docs'
];
List<String> quickLinks = <String>[
  'Database Solutions',
  'Generated Content',
  // 'Resources',
];
List<Icon> bottomNavIcons = const <Icon>[
  Icon(Icons.home),
  Icon(Icons.search),
  Icon(Icons.storage),
  Icon(Icons.settings)
];

List<Icon> serviceDetailIcons = const <Icon>[
  Icon(Icons.check),
  Icon(Icons.close),
  Icon(Icons.lightbulb),
  Icon(Icons.link)
];

List<String> flagTypes = <String>['Incorrect', 'Outdated'];

List<String> defaultQuickFacts = <String>[
  'Cloud computing is taking the tech industry by storm!',
  'How much do you know about cloud computing?',
  'Start learning about cloud computing services today!'
];

const String signInWithGoogle = ' Sign in with Google';
const String google_logo = 'assets/images/google_logo.png';
const String profileImage = 'assets/images/profile.png';
const String cloudLogo = 'assets/images/logo.png';

const String successAlert =
    'Password has been reset successfully. Please check your email for further instructions.';
const String failureAlert = 'Email not found. Please enter a valid email.';
