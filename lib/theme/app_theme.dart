import 'package:babosthapotro/theme/app_color_interface.dart';
import 'package:babosthapotro/theme/app_text_interface.dart';
import 'package:flutter/material.dart';

abstract class AppTheme implements AppColorInterface, AppTextInterface {
  // Helper to generate the Flutter ThemeData
  ThemeData get themeData {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      useMaterial3: true,
    );
  }
}
