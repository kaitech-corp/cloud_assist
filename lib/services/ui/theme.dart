import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///App Theme Data
ThemeData themeDataBuilder() {
  return ThemeData(
    primaryColor: const Color(0xFFFAFAFA),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFAFAFA),iconTheme: IconThemeData(color: Color(0xFF212121)),),
    disabledColor: Colors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),side: const BorderSide(color: Color(-3092272)))))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),side: const BorderSide(color: Color(-3092272)))))),
    textTheme: GoogleFonts.ptSerifTextTheme(const TextTheme(
      displayLarge: TextStyle(color: Colors.black),
      displayMedium: TextStyle(color: Colors.black),
      displaySmall: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontStyle: FontStyle.italic),
      headlineLarge: TextStyle(color: Colors.black),
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

ThemeData themeDataBuilderDark() {
  return ThemeData(
    primaryColor: const Color(0xFF121212),
    canvasColor: const Color(0xFF212121),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black,iconTheme: IconThemeData(color: Colors.grey)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),)))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),)))),
    disabledColor: Colors.grey,
    iconButtonTheme:  IconButtonThemeData(style:ButtonStyle(iconColor: MaterialStateProperty.all(Colors.black))),
    iconTheme: const IconThemeData(color: Colors.grey),
    textTheme: GoogleFonts.latoTextTheme(const TextTheme(
      displayLarge: TextStyle(color: Colors.grey),
      displayMedium: TextStyle(color: Colors.grey),
      displaySmall: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontStyle: FontStyle.italic),
      headlineLarge: TextStyle(color: Colors.grey),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      headlineSmall: TextStyle(color: Colors.grey),
      titleLarge: TextStyle(color: Colors.grey),
      titleMedium: TextStyle(color: Colors.grey),
      titleSmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          fontSize: 14,
          color: Colors.grey),
    )),
  );
}
