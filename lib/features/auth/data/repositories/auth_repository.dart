import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/api/api_client.dart';
import '../../domain/entities/login_params.dart';
import '../../domain/entities/signup_params.dart';
import '../models/login_request.dart';
import '../models/signup_request.dart';
import '../models/verification_request.dart';
import '../models/resend_otp_request.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  Future<void> login(LoginParams params);
  Future<void> signup(SignupParams params);
  Future<void> verifyOtp(String email, String code);
  Future<void> resendOtp(String email, String purpose);
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

  @override
  Future<void> signup(SignupParams params) async {
    await _client.signup(
      SignupRequest(
        email: params.email,
        bmdcNumber: params.bmdcNumber,
        password: params.password,
      ),
    );
  }

  @override
  Future<void> verifyOtp(String email, String code) async {
    await _client.verify(VerificationRequest(email: email, code: code));
  }

  @override
  Future<void> resendOtp(String email, String purpose) async {
    await _client.resendOtp(ResendOtpRequest(email: email, purpose: purpose));
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final client = ref.watch(apiClientProvider);
  return AuthRepositoryImpl(client);
}
