import 'package:babosthapotro/features/auth/data/models/token_model.dart';

abstract class AuthRepository {
  Future<TokenModel> login(String credential, String password);
  Future<void> register(String email, String password, String bmdcNumber);
  Future<void> saveTokens(TokenModel tokens);
  Future<TokenModel?> getTokens();
  Future<void> clearTokens();
}
