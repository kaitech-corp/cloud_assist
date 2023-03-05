
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///App Theme Data
ThemeData themeDataBuilder() {
  return ThemeData(
  // primaryColor: const Color(0xFFFAFAFA),
  // canvasColor: const Color(0xFFFAFAFA),
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
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          fontSize: 14),
    )),
  );
}
