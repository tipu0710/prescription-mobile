import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../local_storage/storage_service.dart';
import '../config/environment_config.dart';
import '../../features/auth/data/repositories/auth_repository.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
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

  // Add Auth Interceptor
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final storage = ref.read(storageServiceProvider);
        final token = storage.getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // If the request itself was a refresh attempt, don't try to refresh again
          if (e.requestOptions.path.contains('/token/refresh/')) {
            return handler.next(e);
          }

          final storage = ref.read(storageServiceProvider);
          final refreshToken = storage.getRefreshToken();

          if (refreshToken != null) {
            try {
              // Retrieve the auth repository provider using the generic provider
              // Note: We need to import the provider from the repository file
              final authRepo = ref.read(authRepositoryProvider);
              final response = await authRepo.refreshToken(refreshToken);

              final newAccess = response.access;
              // Some backends might not return a new refresh token, so we keep the old one if null
              final newRefresh = response.refresh ?? refreshToken;

              await storage.saveToken(newAccess, refreshToken: newRefresh);

              // Update the original request's headers with the new token
              e.requestOptions.headers['Authorization'] = 'Bearer $newAccess';

              // Retry the original request using the main dio instance
              // We need to clone the request options properly
              final retryResponse = await dio.request(
                e.requestOptions.path,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters,
                options: Options(
                  method: e.requestOptions.method,
                  headers: e.requestOptions.headers,
                ),
              );

              return handler.resolve(retryResponse);
            } catch (_) {
              // If refresh fails, fall through to clear session
            }
          }

          // If we reach here, it means either no refresh token or refresh failed
          await storage.clearSession();
        }
        return handler.next(e);
      },
    ),
  );

  return dio;
}
