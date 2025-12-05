import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config.g.dart';

@riverpod
String baseUrl(Ref ref) {
  throw UnimplementedError('baseUrlProvider must be overridden');
}
