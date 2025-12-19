import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

abstract class BaseLightTheme extends AppTheme {
  @override
  Color get foreground => const Color(0xFF020817);
  @override
  Color get card => const Color(0xFFFFFFFF);
  @override
  Color get cardForeground => const Color(0xFF020817);
  @override
  Color get popover => const Color(0xFFFFFFFF);
  @override
  Color get popoverForeground => const Color(0xFF020817);
  @override
  Color get primary => const Color(0xFF2563EB);
  @override
  Color get primaryForeground => const Color(0xFFF8FAFC);
  @override
  Color get secondary => const Color(0xFFF1F5F9);
  @override
  Color get secondaryForeground => const Color(0xFF0F172A);
  @override
  Color get muted => const Color(0xFFF1F5F9);
  @override
  Color get mutedForeground => const Color(0xFF64748B);
  @override
  Color get accent => const Color(0xFFF1F5F9);
  @override
  Color get accentForeground => const Color(0xFF0F172A);
  @override
  Color get destructive => const Color(0xFFEF4444);
  @override
  Color get destructiveForeground => const Color(0xFFF8FAFC);
  @override
  Color get border => const Color(0xFFE2E8F0);
  @override
  Color get input => const Color(0xFFE2E8F0);
  @override
  Color get ring => const Color(0xFF8B5CF6);

  @override
  ColorScheme get colorScheme => ColorScheme.light(
    primary: primary,
    onPrimary: primaryForeground,
    secondary: secondary,
    onSecondary: secondaryForeground,
    surface: card,
    onSurface: cardForeground,
    error: destructive,
    onError: destructiveForeground,
    outline: border,
  );

  @override
  Color get surfaceHighlight => const Color(0xFFF1F5F9);

  @override
  Color get customBrandColor => const Color(0xFF2563EB);
}

// Mobile Portrait Light
class MobilePortraitLightTheme extends BaseLightTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    TextTheme(
      bodyMedium: TextStyle(fontSize: 14, color: foreground),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );

  @override
  TextStyle get customTitleStyle =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: primary);

  @override
  TextStyle get customCaptionStyle =>
      TextStyle(fontSize: 12, color: mutedForeground);
}

// Mobile Landscape Light
class MobileLandscapeLightTheme extends BaseLightTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    TextTheme(
      bodyMedium: TextStyle(fontSize: 13, color: foreground),
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );

  @override
  TextStyle get customTitleStyle =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: primary);

  @override
  TextStyle get customCaptionStyle =>
      TextStyle(fontSize: 11, color: mutedForeground);
}

// Tablet Portrait Light
class TabletPortraitLightTheme extends BaseLightTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: foreground),
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );

  @override
  TextStyle get customTitleStyle =>
      TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: primary);

  @override
  TextStyle get customCaptionStyle =>
      TextStyle(fontSize: 14, color: mutedForeground);
}

// Tablet Landscape Light
class TabletLandscapeLightTheme extends TabletPortraitLightTheme {
  // Can inherit or override further
  @override
  TextStyle get customTitleStyle => TextStyle(
    fontSize: 36, // Even bigger on landscape tablet
    fontWeight: FontWeight.w900,
    color: primary,
  );
}
