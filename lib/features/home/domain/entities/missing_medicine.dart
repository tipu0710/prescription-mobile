import 'package:freezed_annotation/freezed_annotation.dart';

part 'missing_medicine.freezed.dart';
part 'missing_medicine.g.dart';

@freezed
abstract class MissingMedicine with _$MissingMedicine {
  const factory MissingMedicine({
    @JsonKey(name: 'brand_name') required String brandName,
    @JsonKey(name: 'dosage_form') required String dosageForm,
    required String strength,
  }) = _MissingMedicine;

  factory MissingMedicine.fromJson(Map<String, dynamic> json) =>
      _$MissingMedicineFromJson(json);
}
