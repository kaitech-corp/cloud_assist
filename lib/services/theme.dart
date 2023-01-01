import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///App Theme Data
ThemeData themeDataBuilder() {
  return FlexThemeData.light(
    scheme: FlexScheme.bahamaBlue,
      textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(
            headline1: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.black),
            headline2: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.black),
            headline3: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.black,
                fontStyle: FontStyle.italic),
            headline4: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.black),
            headline5: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.black,),
            headline6: TextStyle(fontWeight: FontWeight.bold,
            ),
            subtitle1: TextStyle(fontWeight: FontWeight.bold),
            subtitle2: TextStyle(fontWeight: FontWeight.w600, fontStyle: FontStyle.italic,fontSize: 14),
            button: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
      )
      ),
  );
}
