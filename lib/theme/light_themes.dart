import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

// --- Base Light Implementation to share common values ---
abstract class BaseLightTheme extends AppTheme {
  @override
  ColorScheme get colorScheme => const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.teal,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  @override
  Color get surfaceHighlight => Colors.grey.shade200;

  @override
  Color get customBrandColor => Colors.indigo;
}

// Mobile Portrait Light
class MobilePortraitLightTheme extends BaseLightTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    const TextTheme(
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );

  @override
  TextStyle get customTitleStyle => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: Colors.indigo,
  );

  @override
  TextStyle get customCaptionStyle =>
      const TextStyle(fontSize: 12, color: Colors.grey);
}

// Mobile Landscape Light
class MobileLandscapeLightTheme extends BaseLightTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    const TextTheme(
      // Smaller font size for landscape to fit vertical space? Or same?
      // Let's vary it to verify the requirement.
      bodyMedium: TextStyle(fontSize: 13, color: Colors.black87),
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );

  @override
  TextStyle get customTitleStyle => const TextStyle(
    fontSize: 20, // Compact title
    fontWeight: FontWeight.w900,
    color: Colors.indigo,
  );

  @override
  TextStyle get customCaptionStyle =>
      const TextStyle(fontSize: 11, color: Colors.grey);
}

// Tablet Portrait Light
class TabletPortraitLightTheme extends BaseLightTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );

  @override
  TextStyle get customTitleStyle => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: Colors.indigo,
  );

  @override
  TextStyle get customCaptionStyle =>
      const TextStyle(fontSize: 14, color: Colors.grey);
}

// Tablet Landscape Light
class TabletLandscapeLightTheme extends TabletPortraitLightTheme {
  // Can inherit or override further
  @override
  TextStyle get customTitleStyle => const TextStyle(
    fontSize: 36, // Even bigger on landscape tablet
    fontWeight: FontWeight.w900,
    color: Colors.indigo,
  );
}
