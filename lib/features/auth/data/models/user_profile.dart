import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'bmdc_number') required String bmdcNumber,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'full_name_local') String? fullNameLocal,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'phone_number_local') String? phoneNumberLocal,
    String? designation,
    @JsonKey(name: 'designation_local') String? designationLocal,
    String? expertise,
    @JsonKey(name: 'expertise_local') String? expertiseLocal,
    @JsonKey(name: 'working_place') String? workingPlace,
    @JsonKey(name: 'working_place_local') String? workingPlaceLocal,
    dynamic gender, // Handling oneOf enum/blank as dynamic or String for now
    @JsonKey(name: 'profile_picture') String? profilePicture,
  }) = _UserProfile;

  const UserProfile._();

  bool get isComplete {
    return (fullName?.isNotEmpty ?? false) &&
        (phoneNumber?.isNotEmpty ?? false) &&
        (designation?.isNotEmpty ?? false) &&
        (workingPlace?.isNotEmpty ?? false) &&
        (gender != null && gender.toString().isNotEmpty);
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
