// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalizedMedicine _$LocalizedMedicineFromJson(Map<String, dynamic> json) =>
    _LocalizedMedicine(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      brandName: json['brand_name'] as String,
      genericName: json['generic_name'] as String,
      strength: json['strength'] as String,
      manufacturer: json['manufacturer'] as String,
      dosageForm: json['dosage_form'] as String,
    );

Map<String, dynamic> _$LocalizedMedicineToJson(_LocalizedMedicine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'brand_name': instance.brandName,
      'generic_name': instance.genericName,
      'strength': instance.strength,
      'manufacturer': instance.manufacturer,
      'dosage_form': instance.dosageForm,
    };

_TemplateMedicine _$TemplateMedicineFromJson(Map<String, dynamic> json) =>
    _TemplateMedicine(
      id: (json['id'] as num).toInt(),
      medicineId: (json['medicine_id'] as num?)?.toInt(),
      medicine: LocalizedMedicine.fromJson(
        json['medicine'] as Map<String, dynamic>,
      ),
      dosage: json['dosage'] as String,
      takingTime: json['taking_time'] as String,
      volume: json['volume'] as String,
      duration: json['duration'] as String,
      route: json['route'] as String,
      instruction: json['instruction'] as String,
    );

Map<String, dynamic> _$TemplateMedicineToJson(_TemplateMedicine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicine_id': instance.medicineId,
      'medicine': instance.medicine,
      'dosage': instance.dosage,
      'taking_time': instance.takingTime,
      'volume': instance.volume,
      'duration': instance.duration,
      'route': instance.route,
      'instruction': instance.instruction,
    };

_PrescriptionTemplate _$PrescriptionTemplateFromJson(
  Map<String, dynamic> json,
) => _PrescriptionTemplate(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  medicines: (json['medicines'] as List<dynamic>)
      .map((e) => TemplateMedicine.fromJson(e as Map<String, dynamic>))
      .toList(),
  investigations: (json['investigations'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  advice: json['advice'] as String?,
  nextFollowUp: json['next_follow_up'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$PrescriptionTemplateToJson(
  _PrescriptionTemplate instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'medicines': instance.medicines,
  'investigations': instance.investigations,
  'advice': instance.advice,
  'next_follow_up': instance.nextFollowUp,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
