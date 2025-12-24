import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app.dart';
import '../core/config/environment_config.dart';
import '../core/local_storage/shared_prefs_provider.dart';
import '../core/local_storage/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final storage = StorageService();
  await storage.init();

  runApp(
    ProviderScope(
      overrides: [
        environmentConfigProvider.overrideWithValue(ProdConfig()),
        sharedPreferencesProvider.overrideWithValue(prefs),
        storageServiceProvider.overrideWithValue(storage),
      ],
      child: const MyApp(),
    ),
  );
}
