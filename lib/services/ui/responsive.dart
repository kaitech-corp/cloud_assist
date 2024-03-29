import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

///Responsive wrapper
Widget responsiveWrapperBuilder(BuildContext context, Widget widget){
  return ResponsiveBreakpoints.builder(
    child: widget,
    // maxWidth: 1200,
    // minWidth: 400,
    // defaultScale: true,
    breakpoints: <Breakpoint>[
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1200, name: DESKTOP),
    ],
  );
}
