import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription_template.freezed.dart';
part 'prescription_template.g.dart';

@freezed
abstract class LocalizedMedicine with _$LocalizedMedicine {
  const factory LocalizedMedicine({
    required int id,
    required String slug,
    @JsonKey(name: 'brand_name') required String brandName,
    @JsonKey(name: 'generic_name') required String genericName,
    required String strength,
    required String manufacturer,
    @JsonKey(name: 'dosage_form') required String dosageForm,
  }) = _LocalizedMedicine;

  factory LocalizedMedicine.fromJson(Map<String, dynamic> json) =>
      _$LocalizedMedicineFromJson(json);
}

@freezed
abstract class TemplateMedicine with _$TemplateMedicine {
  const factory TemplateMedicine({
    required int id,
    @JsonKey(name: 'medicine_id') int? medicineId,
    required LocalizedMedicine medicine,
    required String dosage,
    @JsonKey(name: 'taking_time') required String takingTime,
    required String volume,
    required String duration,
    required String route,
    required String instruction,
  }) = _TemplateMedicine;

  factory TemplateMedicine.fromJson(Map<String, dynamic> json) =>
      _$TemplateMedicineFromJson(json);
}

@freezed
abstract class PrescriptionTemplate with _$PrescriptionTemplate {
  const factory PrescriptionTemplate({
    required int id,
    required String name,
    required List<TemplateMedicine> medicines,
    required List<int> investigations,
    required String? advice,
    @JsonKey(name: 'next_follow_up') String? nextFollowUp,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _PrescriptionTemplate;

  factory PrescriptionTemplate.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionTemplateFromJson(json);
}
