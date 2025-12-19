import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:babosthapotro/theme/theme_provider.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    IconData themeIcon;
    switch (themeMode) {
      case ThemeMode.system:
        themeIcon = Icons.brightness_auto;
        break;
      case ThemeMode.light:
        themeIcon = Icons.light_mode;
        break;
      case ThemeMode.dark:
        themeIcon = Icons.dark_mode;
        break;
    }

    return IconButton(
      icon: Icon(themeIcon),
      onPressed: () {
        // Cycle: System -> Light -> Dark -> System
        final newMode = switch (themeMode) {
          ThemeMode.system => ThemeMode.light,
          ThemeMode.light => ThemeMode.dark,
          ThemeMode.dark => ThemeMode.system,
        };
        ref.read(themeModeProvider.notifier).setThemeMode(newMode);
      },
      tooltip: 'Toggle Theme',
    );
  }
}
