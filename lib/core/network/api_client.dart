import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:babosthapotro/core/network/dio_provider.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/auth/login/")
  Future<dynamic> login(@Body() Map<String, dynamic> body);

  @POST("/auth/register/")
  Future<void> register(@Body() Map<String, dynamic> body);
}

@riverpod
ApiClient apiClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient(dio);
}
