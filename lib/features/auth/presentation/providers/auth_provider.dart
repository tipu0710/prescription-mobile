import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/login_params.dart';
import '../../domain/entities/signup_params.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    // nothing to initialize
  }

  Future<void> login(LoginParams params) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.login(params);
    });
  }

  Future<void> signup(SignupParams params) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.signup(params);
    });
  }

  Future<void> verifyOtp(String email, String code) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.verifyOtp(email, code);
    });
  }

  Future<void> resendOtp(String email, String purpose) async {
    // We don't want to set global loading state for resend, to keep UI interactive?
    // Or maybe we do. For now let's set it to loading to prevent double taps.
    // Ideally we might want a separate state for resend, but let's stick to simple first.
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.resendOtp(email, purpose);
    });
  }
}
