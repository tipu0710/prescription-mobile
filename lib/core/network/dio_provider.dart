import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../config/environment_config.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  final config = ref.watch(environmentConfigProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // Add logging interceptor (optional, useful for debug)
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
}
