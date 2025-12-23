import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:babosthapotro/features/auth/domain/entities/signup_params.dart';
import 'package:babosthapotro/features/auth/data/repositories/auth_repository.dart';

part 'signup_controller.g.dart';

@riverpod
class SignupController extends _$SignupController {
  @override
  FutureOr<void> build() {
    // nothing to initialize
  }

  Future<void> signup(SignupParams params) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final authRepository = ref.read(authRepositoryProvider);
      await authRepository.signup(params);
    });
  }
}
