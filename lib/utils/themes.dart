import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData CustomDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(background: kDarkBackground),
    textSelectionTheme: TextSelectionThemeData(cursorColor: kLightBackground),
    appBarTheme: AppBarTheme(
      backgroundColor: kDarkBackground,
      elevation: 0,
      centerTitle: true,
    ),
    cardColor: kAccentColorLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kAccentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: kAccentColor, foregroundColor: kLightBackground),
    iconTheme: IconThemeData(color: kLightBackground),
    scaffoldBackgroundColor: kDarkBackground,
    textTheme: base.textTheme.copyWith(
      bodyLarge: base.textTheme.bodyLarge?.copyWith(
        fontSize: 26,
        color: Colors.white,
      ),
      bodyMedium: base.textTheme.bodyLarge?.copyWith(
        fontSize: 18,
        color: Colors.white,
      ),
      bodySmall: base.textTheme.bodyLarge?.copyWith(
        fontSize: 14,
        color: Colors.white,
      ),
    ),
  );
}

ThemeData CustomLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    appBarTheme: AppBarTheme(
        backgroundColor: kLightBackground,
        elevation: 0,
        centerTitle: true,
        foregroundColor: kDarkBackground),
    textSelectionTheme: TextSelectionThemeData(cursorColor: kAccentColor),
    textTheme: base.textTheme.copyWith(
      bodyLarge: base.textTheme.bodyLarge?.copyWith(
        fontSize: 26,
        color: kDarkBackground,
      ),
      bodyMedium: base.textTheme.bodyMedium?.copyWith(
        fontSize: 18,
        color: kDarkBackground,
      ),
      bodySmall: base.textTheme.bodySmall?.copyWith(
        fontSize: 14,
        color: kDarkBackground,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: kDarkBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
      ),
    ),
    scaffoldBackgroundColor: kLightBackground,
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: kDarkBackground, foregroundColor: kLightBackground),
    //textTheme: TextTheme(
    //bodyMedium:
  );
}
