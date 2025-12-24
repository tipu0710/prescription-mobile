// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
      email: json['email'] as String,
      bmdcNumber: json['bmdc_number'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
      'email': instance.email,
      'bmdc_number': instance.bmdcNumber,
    };
