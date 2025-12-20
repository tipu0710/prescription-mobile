import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/login_params.dart';
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
}
