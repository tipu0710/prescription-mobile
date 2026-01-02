import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/presentation/providers/user_provider.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/entities/update_profile_request.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<void> build() {
    // Initial state is void
  }

  Future<void> updateProfile(
    UpdateProfileRequest data, {
    File? profilePicture,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(profileRepositoryProvider);

      await repository.updateProfile(data, profilePicture: profilePicture);

      // Refresh the user provider to reflect changes in the UI immediately
      ref.invalidate(userProvider);

      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
