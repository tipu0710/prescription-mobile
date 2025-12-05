import 'package:flutter/material.dart';

class AppTheme {
  // Colors extracted from front-end/app/globals.css
  static const primaryColor = Color(0xFF2563EB); // Royal Blue 600
  static const backgroundLight = Colors.white;
  static const backgroundDark = Color(0xFF020617); // Slate 950

  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      surface: backgroundLight,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: backgroundLight,
      surfaceTintColor: Colors.transparent,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      surface: backgroundDark,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: backgroundDark,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: backgroundDark,
      surfaceTintColor: Colors.transparent,
    ),
  );
}
