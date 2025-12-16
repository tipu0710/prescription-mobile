import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../core/local_storage/shared_prefs_provider.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  static const _themePrefsKey = 'theme_mode';

  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final themeIndex = prefs.getInt(_themePrefsKey);
    if (themeIndex != null &&
        themeIndex >= 0 &&
        themeIndex < ThemeMode.values.length) {
      return ThemeMode.values[themeIndex];
    }
    return .system;
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
    final prefs = ref.read(sharedPreferencesProvider);
    prefs.setInt(_themePrefsKey, mode.index);
  }
}
