import 'package:flutter/material.dart';

class StyleTheme {
  static const Color textColor = Color(0xff414141);
  static const Color primaryColor = Color(0xFF00427A);

  static ThemeData get theme {

    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonColor: primaryColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryColor
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: textColor,
          fontFamily: 'Proxima-Nova',
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        headline5: TextStyle(
          color: textColor,
          fontFamily: 'Roboto',
          fontSize: 26,
          fontWeight: FontWeight.w400,
        ),

        headline4: TextStyle(
          color: textColor,
          fontFamily: 'Roboto',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        headline3: TextStyle(
          color: primaryColor,
          fontFamily: 'DancingScript',
          fontSize: 32,
          fontWeight: FontWeight.normal,
        ),
      )
    );
  }

}