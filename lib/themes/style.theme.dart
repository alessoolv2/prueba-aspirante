import 'package:flutter/material.dart';

class StyleTheme {
  static const Color textColor = Color(0xff414141);
  static const Color primaryColor = Color(0xFF00427A);

  static const String PROXIMA_NOVA = 'Proxima-Nova';
  static const String ROBOTO = 'Roboto';
  static const String DANCING_SCRIPT = 'DancingScript';
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
          fontFamily: PROXIMA_NOVA,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
        headline5: TextStyle(
          color: textColor,
          fontFamily: ROBOTO,
          fontSize: 26,
          fontWeight: FontWeight.w400,
        ),

        headline4: TextStyle(
          color: textColor,
          fontFamily: ROBOTO,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        headline3: TextStyle(
          color: primaryColor,
          fontFamily: DANCING_SCRIPT,
          fontSize: 32,
          fontWeight: FontWeight.normal,
        ),
      )
    );
  }

}