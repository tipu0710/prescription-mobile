import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/router_provider.dart';
import 'theme/responsive_theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return AppThemeBuilder(
      builder: (context, appTheme) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: appTheme.themeData,
          routerConfig: router,
        );
      },
    );
  }
}
