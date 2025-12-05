import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:babosthapotro/core/network/api_client.dart';
import 'package:babosthapotro/features/auth/data/models/token_model.dart';

part 'auth_remote_data_source.g.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel> login(String credential, String password);
  Future<void> register(String email, String password, String bmdcNumber);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<TokenModel> login(String credential, String password) async {
    final response = await _apiClient.login({
      'credential': credential,
      'password': password,
    });
    return TokenModel.fromJson(response as Map<String, dynamic>);
  }

  @override
  Future<void> register(
    String email,
    String password,
    String bmdcNumber,
  ) async {
    await _apiClient.register({
      'email': email,
      'password': password,
      'bmdc_number': bmdcNumber,
    });
  }
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRemoteDataSourceImpl(apiClient);
}
