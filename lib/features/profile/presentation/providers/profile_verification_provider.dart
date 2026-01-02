import 'package:babosthapotro/features/profile/domain/entities/degree.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/api/api_client.dart';
import '../../../auth/data/models/user_profile.dart';

part 'profile_verification_provider.g.dart';

@riverpod
class ProfileVerification extends _$ProfileVerification {
  @override
  Future<bool> build() async {
    final client = ref.watch(apiClientProvider);

    try {
      final results = await Future.wait([
        client.getProfile(),
        client.getDegrees(),
      ]);

      final profile = results[0] as UserProfile;
      final degrees = results[1] as List<Degree>;

      final isProfileComplete =
          (profile.fullName?.isNotEmpty ?? false) &&
          (profile.phoneNumber?.isNotEmpty ?? false) &&
          (profile.designation?.isNotEmpty ?? false) &&
          (profile.workingPlace?.isNotEmpty ?? false) &&
          (profile.gender != null && profile.gender.toString().isNotEmpty);

      final hasDegrees = degrees.isNotEmpty;

      return isProfileComplete && hasDegrees;
    } catch (e) {
      // If we can't fetch, we assume it's not verified or let the error bubble
      // If 401, the router's auth guard should handle it.
      rethrow;
    }
  }
}
