import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///App Theme Data
ThemeData themeDataBuilder() {
  return FlexThemeData.light(
    scheme: FlexScheme.bahamaBlue,
    textTheme: GoogleFonts.latoTextTheme(const TextTheme(
      displayLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      displayMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      displaySmall: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontStyle: FontStyle.italic),
      headlineLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          fontSize: 14),
    )),
  ).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
              backgroundColor: MaterialStateProperty.all(Colors.white)
                  ),
                  ));
}
