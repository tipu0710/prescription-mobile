// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'degree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Degree _$DegreeFromJson(Map<String, dynamic> json) => _Degree(
  id: (json['id'] as num).toInt(),
  degreeName: json['degree_name'] as String,
  degreeNameLocal: json['degree_name_local'] as String,
  fieldOfStudy: json['field_of_study'] as String,
  fieldOfStudyLocal: json['field_of_study_local'] as String,
  institution: json['institution'] as String,
  institutionLocal: json['institution_local'] as String,
);

Map<String, dynamic> _$DegreeToJson(_Degree instance) => <String, dynamic>{
  'id': instance.id,
  'degree_name': instance.degreeName,
  'degree_name_local': instance.degreeNameLocal,
  'field_of_study': instance.fieldOfStudy,
  'field_of_study_local': instance.fieldOfStudyLocal,
  'institution': instance.institution,
  'institution_local': instance.institutionLocal,
};
