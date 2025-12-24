import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/api/api_client.dart';
import '../../data/models/user_profile.dart';

part 'user_provider.g.dart';

@riverpod
class User extends _$User {
  @override
  Future<UserProfile> build() {
    return ref.watch(apiClientProvider).getProfile();
  }
}
