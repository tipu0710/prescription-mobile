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
  Color get primary => const Color(0xFF3B82F6); // Updated to match design
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
  Color get ring => const Color(0xFF3B82F6);
  @override
  Color get success => const Color(0xFF22C55E);
  @override
  Color get warning => const Color(0xFFF59E0B);
  @override
  Color get info => const Color(0xFF3B82F6);

  // --- Typography Implementation ---

  // Display - Large (Welcome Heading)
  @override
  TextStyle get displayLarge => GoogleFonts.roboto(
    fontSize: 24, // text-2xl
    fontWeight: FontWeight.bold,
    color: foreground,
  );
  @override
  TextStyle get displayMedium => GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: foreground,
  );
  @override
  TextStyle get displaySmall => GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: foreground,
  );

  // Headline
  @override
  TextStyle get headlineLarge => GoogleFonts.roboto(
    fontSize: 20, // text-xl
    fontWeight: FontWeight.bold,
    color: foreground,
  );
  @override
  TextStyle get headlineMedium => GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: foreground,
  );
  @override
  TextStyle get headlineSmall => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: foreground,
  );

  // Title (Card Titles, Section Headers)
  @override
  TextStyle get titleLarge => GoogleFonts.roboto(
    fontSize: 18, // text-lg
    fontWeight: FontWeight.w600,
    color: foreground,
  );
  @override
  TextStyle get titleMedium => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: foreground,
  );
  @override
  TextStyle get titleSmall => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: foreground,
  );

  // Body (Standard text)
  @override
  TextStyle get bodyLarge => GoogleFonts.roboto(
    fontSize: 16, // text-base
    fontWeight: FontWeight.normal,
    color: foreground,
  );
  @override
  TextStyle get bodyMedium => GoogleFonts.roboto(
    fontSize: 14, // text-sm
    fontWeight: FontWeight.normal,
    color: foreground,
  );
  @override
  TextStyle get bodySmall => GoogleFonts.roboto(
    fontSize: 12, // text-xs
    fontWeight: FontWeight.normal,
    color: mutedForeground,
  );

  // Label (Buttons, Inputs, Captions)
  @override
  TextStyle get labelLarge => GoogleFonts.roboto(
    fontSize: 14, // text-sm (Medium)
    fontWeight: FontWeight.w500,
    color: foreground,
  );
  @override
  TextStyle get labelMedium => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: foreground,
  );
  @override
  TextStyle get labelSmall => GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: mutedForeground,
  );

  @override
  Color get scaffoldColor => const Color(0xFFFFFFFF);

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
}

// Tablet Landscape Light
class TabletLandscapeLightTheme extends TabletPortraitLightTheme {
  // Can inherit or override further
}
