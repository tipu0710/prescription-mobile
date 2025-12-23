// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_confirm_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PasswordResetConfirmRequestModel _$PasswordResetConfirmRequestModelFromJson(
  Map<String, dynamic> json,
) => _PasswordResetConfirmRequestModel(
  email: json['email'] as String,
  code: json['code'] as String,
  newPassword: json['new_password'] as String,
);

Map<String, dynamic> _$PasswordResetConfirmRequestModelToJson(
  _PasswordResetConfirmRequestModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'code': instance.code,
  'new_password': instance.newPassword,
};
