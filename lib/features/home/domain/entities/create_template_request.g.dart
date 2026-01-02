// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_template_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTemplateMedicine _$CreateTemplateMedicineFromJson(
  Map<String, dynamic> json,
) => _CreateTemplateMedicine(
  medicineId: (json['medicine_id'] as num).toInt(),
  dosage: json['dosage'] as String,
  takingTime: json['taking_time'] as String,
  duration: json['duration'] as String,
  route: json['route'] as String,
  instruction: json['instruction'] as String,
);

Map<String, dynamic> _$CreateTemplateMedicineToJson(
  _CreateTemplateMedicine instance,
) => <String, dynamic>{
  'medicine_id': instance.medicineId,
  'dosage': instance.dosage,
  'taking_time': instance.takingTime,
  'duration': instance.duration,
  'route': instance.route,
  'instruction': instance.instruction,
};

_CreateTemplateRequest _$CreateTemplateRequestFromJson(
  Map<String, dynamic> json,
) => _CreateTemplateRequest(
  name: json['name'] as String,
  medicines: (json['medicines'] as List<dynamic>)
      .map((e) => CreateTemplateMedicine.fromJson(e as Map<String, dynamic>))
      .toList(),
  investigations: (json['investigations'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  advice: json['advice'] as String?,
  nextFollowUp: json['next_follow_up'] as String?,
);

Map<String, dynamic> _$CreateTemplateRequestToJson(
  _CreateTemplateRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'medicines': instance.medicines,
  'investigations': instance.investigations,
  'advice': instance.advice,
  'next_follow_up': instance.nextFollowUp,
};
