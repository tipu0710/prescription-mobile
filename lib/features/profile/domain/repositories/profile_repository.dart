import 'dart:io';

import '../entities/update_profile_request.dart';

abstract class ProfileRepository {
  Future<void> updateProfile(UpdateProfileRequest data, {File? profilePicture});
}
