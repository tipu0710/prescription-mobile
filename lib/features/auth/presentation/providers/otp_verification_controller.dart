import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:babosthapotro/features/auth/data/repositories/auth_repository.dart';

part 'otp_verification_controller.g.dart';

@riverpod
class OtpVerificationController extends _$OtpVerificationController {
  @override
  FutureOr<void> build() {
    // nothing to initialize
  }

  Future<void> verifyOtp(String email, String code) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.verifyOtp(email, code);
    });
  }

  Future<void> resendOtp(String email, String purpose) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.resendOtp(email, purpose);
    });
  }
}
