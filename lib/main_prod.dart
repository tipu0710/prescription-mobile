import 'package:babosthapotro/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:babosthapotro/main.dart';

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
