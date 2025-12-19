import 'package:flutter/material.dart';

abstract interface class AppTextInterface {
  TextTheme get textTheme;

  // Display styles
  TextStyle get displayLarge;
  TextStyle get displayMedium;
  TextStyle get displaySmall;

  // Headline styles
  TextStyle get headlineLarge;
  TextStyle get headlineMedium;
  TextStyle get headlineSmall;

  // Title styles
  TextStyle get titleLarge;
  TextStyle get titleMedium;
  TextStyle get titleSmall;

  // Body styles
  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;

  // Label styles
  TextStyle get labelLarge;
  TextStyle get labelMedium;
  TextStyle get labelSmall;
}
