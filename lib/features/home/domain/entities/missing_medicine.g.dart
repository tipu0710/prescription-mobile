// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missing_medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MissingMedicine _$MissingMedicineFromJson(Map<String, dynamic> json) =>
    _MissingMedicine(
      brandName: json['brand_name'] as String,
      dosageForm: json['dosage_form'] as String,
      strength: json['strength'] as String,
    );

Map<String, dynamic> _$MissingMedicineToJson(_MissingMedicine instance) =>
    <String, dynamic>{
      'brand_name': instance.brandName,
      'dosage_form': instance.dosageForm,
      'strength': instance.strength,
    };
