import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/api/api_client.dart';
import '../../domain/entities/update_profile_request.dart';
import '../../domain/repositories/profile_repository.dart';

part 'profile_repository_impl.g.dart';

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepositoryImpl(ref.watch(apiClientProvider));
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ApiClient _apiClient;

  ProfileRepositoryImpl(this._apiClient);

  @override
  Future<void> updateProfile(
    UpdateProfileRequest data, {
    File? profilePicture,
  }) async {
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

    await _apiClient.updateProfile(formData);
  }
}
