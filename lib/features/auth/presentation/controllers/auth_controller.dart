import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:babosthapotro/features/auth/data/repositories/auth_repository_impl.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    // Initial state is void (idle)
  }

  Future<void> login(String credential, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).login(credential, password),
    );
  }

  Future<void> register(
    String email,
    String password,
    String bmdcNumber,
  ) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(authRepositoryProvider)
          .register(email, password, bmdcNumber),
    );
  }
}
