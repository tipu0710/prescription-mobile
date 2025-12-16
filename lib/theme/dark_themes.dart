import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

// --- Base Dark Implementation ---
abstract class BaseDarkTheme extends AppTheme {
  @override
  ColorScheme get colorScheme => const ColorScheme.dark(
    primary: Colors.blueAccent,
    secondary: Colors.tealAccent,
    surface: Color(0xFF121212),
    onSurface: Colors.white,
  );

  @override
  Color get surfaceHighlight => Colors.white10;

  @override
  Color get customBrandColor => Colors.indigoAccent;
}

// Mobile Portrait Dark
class MobilePortraitDarkTheme extends BaseDarkTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    const TextTheme(
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  @override
  TextStyle get customTitleStyle => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: Colors.indigoAccent,
  );

  @override
  TextStyle get customCaptionStyle =>
      const TextStyle(fontSize: 12, color: Colors.white54);
}

// Mobile Landscape Dark
class MobileLandscapeDarkTheme extends BaseDarkTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    const TextTheme(
      bodyMedium: TextStyle(fontSize: 13, color: Colors.white),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  @override
  TextStyle get customTitleStyle => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: Colors.indigoAccent,
  );

  @override
  TextStyle get customCaptionStyle =>
      const TextStyle(fontSize: 11, color: Colors.white54);
}

// Tablet Portrait Dark
class TabletPortraitDarkTheme extends BaseDarkTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  @override
  TextStyle get customTitleStyle => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: Colors.indigoAccent,
  );

  @override
  TextStyle get customCaptionStyle =>
      const TextStyle(fontSize: 14, color: Colors.white54);
}

// Tablet Landscape Dark
class TabletLandscapeDarkTheme extends TabletPortraitDarkTheme {
  @override
  TextStyle get customTitleStyle => const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w900,
    color: Colors.indigoAccent,
  );
}
