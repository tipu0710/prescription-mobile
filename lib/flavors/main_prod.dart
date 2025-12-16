import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app.dart';

import '../core/config/environment_config.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [environmentConfigProvider.overrideWithValue(ProdConfig())],
      child: const MyApp(),
    ),
  );
}
