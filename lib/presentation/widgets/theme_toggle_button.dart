import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:babosthapotro/theme/theme_provider.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    IconData themeIcon;
    themeIcon = switch (themeMode) {
      .system => Icons.brightness_auto,
      .light => Icons.light_mode,
      .dark => Icons.dark_mode,
    };

    return IconButton(
      icon: Icon(themeIcon),
      onPressed: () {
        // Toggle: Light <-> Dark
        final newMode = themeMode == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;
        ref.read(themeModeProvider.notifier).setThemeMode(newMode);
      },
      tooltip: 'Toggle Theme',
    );
  }
}
