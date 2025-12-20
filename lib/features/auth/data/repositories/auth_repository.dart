import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/api/api_client.dart';
import '../../domain/entities/login_params.dart';
import '../models/login_request.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  Future<void> login(LoginParams params);
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _client;

  AuthRepositoryImpl(this._client);

  @override
  Future<void> login(LoginParams params) async {
    await _client.login(
      LoginRequest(credential: params.credential, password: params.password),
    );
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final client = ref.watch(apiClientProvider);
  return AuthRepositoryImpl(client);
}
