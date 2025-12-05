import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:babosthapotro/core/router/router.dart';
import 'package:babosthapotro/core/theme/app_theme.dart';
import 'package:babosthapotro/core/theme/theme_controller.dart';
import 'package:babosthapotro/core/config/app_config.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        baseUrlProvider.overrideWithValue('https://api.babosthapotro.com'),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final themeModeAsync = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      title: 'Babosthapotro',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeModeAsync.value ?? ThemeMode.system,
      routerConfig: router,
    );
  }
}
