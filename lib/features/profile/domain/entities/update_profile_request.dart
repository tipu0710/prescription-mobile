import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_request.freezed.dart';
part 'update_profile_request.g.dart';

@freezed
abstract class UpdateProfileRequest with _$UpdateProfileRequest {
  const factory UpdateProfileRequest({
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
    dynamic gender,
  }) = _UpdateProfileRequest;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
