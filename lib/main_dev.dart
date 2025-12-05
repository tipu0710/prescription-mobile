import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:babosthapotro/main.dart';
import 'package:babosthapotro/core/config/app_config.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [baseUrlProvider.overrideWithValue('http://127.0.0.1:8000')],
      child: const MyApp(),
    ),
  );
}
