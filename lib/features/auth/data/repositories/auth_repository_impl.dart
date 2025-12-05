import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:babosthapotro/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:babosthapotro/features/auth/data/models/token_model.dart';
import 'package:babosthapotro/features/auth/domain/repositories/auth_repository.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<TokenModel> login(String credential, String password) async {
    final tokens = await _remoteDataSource.login(credential, password);
    await saveTokens(tokens);
    return tokens;
  }

  @override
  Future<void> register(String email, String password, String bmdcNumber) {
    return _remoteDataSource.register(email, password, bmdcNumber);
  }

  @override
  Future<void> saveTokens(TokenModel tokens) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, tokens.access);
    await prefs.setString(_refreshTokenKey, tokens.refresh);
  }

  @override
  Future<TokenModel?> getTokens() async {
    final prefs = await SharedPreferences.getInstance();
    final access = prefs.getString(_accessTokenKey);
    final refresh = prefs.getString(_refreshTokenKey);
    if (access != null && refresh != null) {
      return TokenModel(access: access, refresh: refresh);
    }
    return null;
  }

  @override
  Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
}
