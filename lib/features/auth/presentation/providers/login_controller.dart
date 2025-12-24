import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:babosthapotro/features/auth/domain/entities/login_params.dart';
import 'package:babosthapotro/features/auth/data/repositories/auth_repository.dart';
import '../../../../core/local_storage/storage_service.dart'; // Import StorageService

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
      final response = await authRepository.login(params);

      // Save token
      if (response.access != null) {
        await ref
            .read(storageServiceProvider)
            .saveToken(response.access!, refreshToken: response.refresh);
      }
    });
  }
}
