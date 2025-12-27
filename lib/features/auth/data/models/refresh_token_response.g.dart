// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshTokenResponse _$RefreshTokenResponseFromJson(
  Map<String, dynamic> json,
) => _RefreshTokenResponse(
  access: json['access'] as String,
  refresh: json['refresh'] as String?,
);

Map<String, dynamic> _$RefreshTokenResponseToJson(
  _RefreshTokenResponse instance,
) => <String, dynamic>{'access': instance.access, 'refresh': instance.refresh};
