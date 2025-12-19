import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';

// --- Base Dark Implementation ---
abstract class BaseDarkTheme extends AppTheme {
  @override
  Color get foreground => const Color(0xFFF8FAFC);
  @override
  Color get card => const Color(0xFF020817);
  @override
  Color get cardForeground => const Color(0xFFF8FAFC);
  @override
  Color get popover => const Color(0xFF020817);
  @override
  Color get popoverForeground => const Color(0xFFF8FAFC);
  @override
  Color get primary => const Color(0xFF2563EB);
  @override
  Color get primaryForeground => const Color(0xFFF8FAFC);
  @override
  Color get secondary => const Color(0xFF1E293B);
  @override
  Color get secondaryForeground => const Color(0xFFF8FAFC);
  @override
  Color get muted => const Color(0xFF1E293B);
  @override
  Color get mutedForeground => const Color(0xFF94A3B8);
  @override
  Color get accent => const Color(0xFF1E293B);
  @override
  Color get accentForeground => const Color(0xFFF8FAFC);
  @override
  Color get destructive => const Color(0xFF7F1D1D);
  @override
  Color get destructiveForeground => const Color(0xFFF8FAFC);
  @override
  Color get border => const Color(0xFF1E293B);
  @override
  Color get input => const Color(0xFF1E293B);
  @override
  Color get ring => const Color(0xFF2563EB);

  // --- Typography Implementation ---

  // Display
  @override
  TextStyle get displayLarge => GoogleFonts.roboto(
    fontSize: 24,
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
    fontSize: 20,
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

  // Title
  @override
  TextStyle get titleLarge => GoogleFonts.roboto(
    fontSize: 18,
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

  // Body
  @override
  TextStyle get bodyLarge => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: foreground,
  );
  @override
  TextStyle get bodyMedium => GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: foreground,
  );
  @override
  TextStyle get bodySmall => GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: mutedForeground,
  );

  // Label
  @override
  TextStyle get labelLarge => GoogleFonts.roboto(
    fontSize: 14,
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
  ColorScheme get colorScheme => ColorScheme.dark(
    primary: primary,
    onPrimary: primaryForeground,
    secondary: secondary,
    onSecondary: secondaryForeground,
    surface: const Color(0xFF020817),
    onSurface: foreground,
    error: destructive,
    onError: destructiveForeground,
    outline: border,
  );

  @override
  Color get surfaceHighlight => const Color(0xFF1E293B);

  @override
  Color get customBrandColor => const Color(0xFF2563EB);
}

// Mobile Portrait Dark
class MobilePortraitDarkTheme extends BaseDarkTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    TextTheme(
      bodyMedium: TextStyle(fontSize: 14, color: foreground),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: foreground,
      ),
    ),
  );

  @override
  TextStyle get customTitleStyle =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: primary);

  @override
  TextStyle get customCaptionStyle =>
      TextStyle(fontSize: 12, color: mutedForeground);
}

// Mobile Landscape Dark
class MobileLandscapeDarkTheme extends BaseDarkTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    TextTheme(
      bodyMedium: TextStyle(fontSize: 13, color: foreground),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: foreground,
      ),
    ),
  );

  @override
  TextStyle get customTitleStyle =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: primary);

  @override
  TextStyle get customCaptionStyle =>
      TextStyle(fontSize: 11, color: mutedForeground);
}

// Tablet Portrait Dark
class TabletPortraitDarkTheme extends BaseDarkTheme {
  @override
  TextTheme get textTheme => GoogleFonts.robotoTextTheme(
    TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: foreground),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: foreground,
      ),
    ),
  );

  @override
  TextStyle get customTitleStyle =>
      TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: primary);

  @override
  TextStyle get customCaptionStyle =>
      TextStyle(fontSize: 14, color: mutedForeground);
}

// Tablet Landscape Dark
class TabletLandscapeDarkTheme extends TabletPortraitDarkTheme {
  @override
  TextStyle get customTitleStyle =>
      TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: primary);
}
