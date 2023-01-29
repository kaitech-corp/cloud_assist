import 'package:flutter/material.dart';

import 'services/navigation/navigation.dart';
import 'services/responsive.dart';
import 'services/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (BuildContext context, Widget? widget) {
        return responsiveWrapperBuilder(context, widget!);
      },
      theme: themeDataBuilder(),
      routerConfig: router,
    );
  }
}
