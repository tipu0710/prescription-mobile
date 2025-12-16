import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/network/dio_provider.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // TODO: Add your API methods here
  // @GET("/users")
  // Future<List<User>> getUsers();
}

@riverpod
ApiClient apiClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient(dio);
}
