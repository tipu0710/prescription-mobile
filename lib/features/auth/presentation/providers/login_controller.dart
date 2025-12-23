import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:babosthapotro/features/auth/domain/entities/login_params.dart';
import 'package:babosthapotro/features/auth/data/repositories/auth_repository.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
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
}
