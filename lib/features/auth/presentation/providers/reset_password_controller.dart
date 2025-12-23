import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:babosthapotro/features/auth/data/repositories/auth_repository.dart';

part 'reset_password_controller.g.dart';

@riverpod
class ResetPasswordController extends _$ResetPasswordController {
  @override
  FutureOr<void> build() {
    // nothing to initialize
  }

  Future<void> confirmPasswordReset(
    String email,
    String code,
    String newPassword,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.confirmPasswordReset(email, code, newPassword);
    });
  }
}
