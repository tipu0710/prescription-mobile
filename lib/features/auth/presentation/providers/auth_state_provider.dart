import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/local_storage/storage_service.dart';

part 'auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  @override
  bool build() {
    return ref.watch(storageServiceProvider).getToken() != null;
  }

  Future<void> authenticate(String accessToken, {String? refreshToken}) async {
    await ref
        .read(storageServiceProvider)
        .saveToken(accessToken, refreshToken: refreshToken);
    state = true;
  }

  Future<void> unauthenticate() async {
    await ref.read(storageServiceProvider).clearSession();
    state = false;
  }
}
