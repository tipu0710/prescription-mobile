import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Environment { dev, prod }

abstract class EnvironmentConfig {
  Environment get environment;
  String get baseUrl;
}

class DevConfig implements EnvironmentConfig {
  @override
  Environment get environment => Environment.dev;

  @override
  String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8000';
    }
    return 'http://localhost:8000';
  }
}

class ProdConfig implements EnvironmentConfig {
  @override
  Environment get environment => Environment.prod;

  @override
  String get baseUrl => 'https://babosthapotro.com';
}

final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  throw UnimplementedError('EnvironmentConfig must be overridden in main.dart');
});
