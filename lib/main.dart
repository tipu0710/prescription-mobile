import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:babosthapotro/core/config/environment_config.dart';
import 'package:babosthapotro/core/local_storage/shared_prefs_provider.dart';
import 'package:babosthapotro/core/local_storage/storage_service.dart';
import 'package:babosthapotro/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  // Initialize StorageService
  final storageService = StorageService();
  await storageService.init();

  runApp(
    ProviderScope(
      overrides: [
        environmentConfigProvider.overrideWithValue(DevConfig()),
        sharedPreferencesProvider.overrideWithValue(prefs),
        storageServiceProvider.overrideWithValue(
          storageService,
        ), // Override storageServiceProvider
      ],
      child: const MyApp(),
    ),
  );
}
