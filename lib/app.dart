import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/router_provider.dart';
import 'core/utils/toast_service.dart';
import 'presentation/widgets/theme_toggle_button.dart';
import 'theme/responsive_theme.dart';
import 'theme/theme_extensions.dart';

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

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skeleton'),
        actions: const [ThemeToggleButton()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flavor: default', style: context.textStyle.titleLarge),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              color: context.appColor.card,
              child: Text(
                'Brand Color Box',
                style: TextStyle(color: context.appColor.onPrimary),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => ToastService.showSuccess(
                context,
                message: "Operation completed successfully!",
              ),
              child: const Text("Show Success Toast"),
            ),
            ElevatedButton(
              onPressed: () => ToastService.showWarning(
                context,
                message: "Please double check your inputs.",
              ),
              child: const Text("Show Warning Toast"),
            ),
            ElevatedButton(
              onPressed: () => ToastService.showError(
                context,
                message: "Failed to connect to server.",
              ),
              child: const Text("Show Error Toast"),
            ),
            ElevatedButton(
              onPressed: () => ToastService.showInfo(
                context,
                message: "New update available v1.0.1",
              ),
              child: const Text("Show Info Toast"),
            ),
          ],
        ),
      ),
    );
  }
}
