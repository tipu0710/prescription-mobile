import 'package:flutter/material.dart';
import 'package:babosthapotro/theme/app_color_interface.dart';
import 'package:babosthapotro/theme/app_text_interface.dart';
import 'app_theme.dart';
import 'responsive_theme.dart';

extension ThemeContext on BuildContext {
  AppColors get appColor => AppColors(ThemeConfig.of(this).theme);
  AppTextStyles get textStyle => AppTextStyles(ThemeConfig.of(this).theme);
}

class AppColors implements AppColorInterface {
  final AppTheme _theme;
  AppColors(this._theme);

  // Core ColorScheme proxies
  @override
  ColorScheme get colorScheme => _theme.colorScheme;

  // Convenience proxies for ColorScheme properties not in AppColorInterface
  Color get onPrimary => _theme.colorScheme.onPrimary;
  Color get onSecondary => _theme.colorScheme.onSecondary;
  Color get error => _theme.colorScheme.error;
  Color get onError => _theme.colorScheme.onError;
  Color get surface => _theme.colorScheme.surface;
  Color get onSurface => _theme.colorScheme.onSurface;

  Brightness get brightness => _theme.colorScheme.brightness;

  @override
  Color get foreground => _theme.foreground;
  @override
  Color get card => _theme.card;
  @override
  Color get cardForeground => _theme.cardForeground;
  @override
  Color get popover => _theme.popover;
  @override
  Color get popoverForeground => _theme.popoverForeground;
  @override
  Color get primary => _theme.primary;
  @override
  Color get primaryForeground => _theme.primaryForeground;
  @override
  Color get secondary => _theme.secondary;
  @override
  Color get secondaryForeground => _theme.secondaryForeground;
  @override
  Color get muted => _theme.muted;
  @override
  Color get mutedForeground => _theme.mutedForeground;
  @override
  Color get accent => _theme.accent;
  @override
  Color get accentForeground => _theme.accentForeground;
  @override
  Color get destructive => _theme.destructive;
  @override
  Color get destructiveForeground => _theme.destructiveForeground;
  @override
  Color get border => _theme.border;
  @override
  Color get input => _theme.input;
  @override
  Color get ring => _theme.ring;

  // Custom Colors
  @override
  Color get surfaceHighlight => _theme.surfaceHighlight;
  @override
  Color get customBrandColor => _theme.customBrandColor;
}

class AppTextStyles implements AppTextInterface {
  final AppTheme _theme;
  AppTextStyles(this._theme);

  // Core TextTheme proxies
  @override
  TextTheme get textTheme => _theme.textTheme;

  TextStyle? get displayLarge => _theme.textTheme.displayLarge;
  TextStyle? get displayMedium => _theme.textTheme.displayMedium;
  TextStyle? get displaySmall => _theme.textTheme.displaySmall;
  TextStyle? get headlineLarge => _theme.textTheme.headlineLarge;
  TextStyle? get headlineMedium => _theme.textTheme.headlineMedium;
  TextStyle? get headlineSmall => _theme.textTheme.headlineSmall;
  TextStyle? get titleLarge => _theme.textTheme.titleLarge;
  TextStyle? get titleMedium => _theme.textTheme.titleMedium;
  TextStyle? get titleSmall => _theme.textTheme.titleSmall;
  TextStyle? get bodyLarge => _theme.textTheme.bodyLarge;
  TextStyle? get bodyMedium => _theme.textTheme.bodyMedium;
  TextStyle? get bodySmall => _theme.textTheme.bodySmall;
  TextStyle? get labelLarge => _theme.textTheme.labelLarge;
  TextStyle? get labelMedium => _theme.textTheme.labelMedium;
  TextStyle? get labelSmall => _theme.textTheme.labelSmall;

  // Custom TextStyles
  @override
  TextStyle get customTitleStyle => _theme.customTitleStyle;
  @override
  TextStyle get customCaptionStyle => _theme.customCaptionStyle;
}
