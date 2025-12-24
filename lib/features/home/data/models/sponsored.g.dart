// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsored.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sponsored _$SponsoredFromJson(Map<String, dynamic> json) => _Sponsored(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  detailsUrl: json['details_url'] as String,
  isActive: json['is_active'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$SponsoredToJson(_Sponsored instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'details_url': instance.detailsUrl,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
    };
