// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateProfileRequest _$UpdateProfileRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateProfileRequest(
  fullName: json['full_name'] as String?,
  fullNameLocal: json['full_name_local'] as String?,
  phoneNumber: json['phone_number'] as String?,
  phoneNumberLocal: json['phone_number_local'] as String?,
  designation: json['designation'] as String?,
  designationLocal: json['designation_local'] as String?,
  expertise: json['expertise'] as String?,
  expertiseLocal: json['expertise_local'] as String?,
  workingPlace: json['working_place'] as String?,
  workingPlaceLocal: json['working_place_local'] as String?,
  gender: json['gender'],
);

Map<String, dynamic> _$UpdateProfileRequestToJson(
  _UpdateProfileRequest instance,
) => <String, dynamic>{
  'full_name': instance.fullName,
  'full_name_local': instance.fullNameLocal,
  'phone_number': instance.phoneNumber,
  'phone_number_local': instance.phoneNumberLocal,
  'designation': instance.designation,
  'designation_local': instance.designationLocal,
  'expertise': instance.expertise,
  'expertise_local': instance.expertiseLocal,
  'working_place': instance.workingPlace,
  'working_place_local': instance.workingPlaceLocal,
  'gender': instance.gender,
};
