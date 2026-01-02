// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Medicine _$MedicineFromJson(Map<String, dynamic> json) => _Medicine(
  id: (json['id'] as num).toInt(),
  brandName: json['brand_name'] as String,
  genericName: json['generic_name'] as String,
  strength: json['strength'] as String,
  manufacturer: json['manufacturer'] as String,
  dosageForm: json['dosage_form'] as String,
);

Map<String, dynamic> _$MedicineToJson(_Medicine instance) => <String, dynamic>{
  'id': instance.id,
  'brand_name': instance.brandName,
  'generic_name': instance.genericName,
  'strength': instance.strength,
  'manufacturer': instance.manufacturer,
  'dosage_form': instance.dosageForm,
};
