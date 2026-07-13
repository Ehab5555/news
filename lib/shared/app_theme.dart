import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff39A552);
  static const Color darkPrimaryColor = Color(0xff1E1E1E);
  static const Color appBarDark = Color(0xff003049);
  static const Color navy = Color(0xff4F5A69);
  static const Color black = Color(0xff303030);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: white,
      elevation: 8,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: black,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: navy,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: darkPrimaryColor,
      foregroundColor: white,
      elevation: 8,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: white,
      ),
    ),
  );
}
