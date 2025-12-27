import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import '../../../../data/api/api_client.dart';
import '../../../auth/presentation/providers/user_provider.dart';
import '../../data/models/update_profile_request.dart';

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
      final client = ref.read(apiClientProvider);

      final json = data.toJson();
      json.removeWhere((key, value) => value == null);

      final formData = FormData.fromMap(json);

      if (profilePicture != null) {
        formData.files.add(
          MapEntry(
            'profile_picture',
            await MultipartFile.fromFile(
              profilePicture.path,
              filename: profilePicture.path.split(Platform.pathSeparator).last,
            ),
          ),
        );
      }

      await client.updateProfile(formData);

      // Refresh the user provider to reflect changes in the UI immediately
      ref.invalidate(userProvider);

      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
