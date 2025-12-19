import 'package:flutter/material.dart';
import 'theme/responsive_theme.dart';
import 'theme/theme_extensions.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (context, appTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme.themeData,
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text('Skeleton')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flavor: default', style: context.textStyle.titleLarge),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              color: context.appColor.customBrandColor,
              child: Text(
                'Brand Color Box',
                style: TextStyle(color: context.appColor.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
