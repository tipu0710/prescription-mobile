import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Environment { dev, prod }

abstract class EnvironmentConfig {
  Environment get environment;
  String get baseUrl;
}

class DevConfig implements EnvironmentConfig {
  @override
  Environment get environment => .dev;

  @override
  String get baseUrl => 'https://dev-cloud-run-service-url';
}

class ProdConfig implements EnvironmentConfig {
  @override
  Environment get environment => .prod;

  @override
  String get baseUrl => 'https://prod-cloud-run-service-url';
}

final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  throw UnimplementedError('EnvironmentConfig must be overridden in main.dart');
});
