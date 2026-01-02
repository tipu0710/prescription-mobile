import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine.freezed.dart';
part 'medicine.g.dart';

@freezed
abstract class Medicine with _$Medicine {
  const factory Medicine({
    required int id,
    @JsonKey(name: 'brand_name') required String brandName,
    @JsonKey(name: 'generic_name') required String genericName,
    required String strength,
    required String manufacturer,
    @JsonKey(name: 'dosage_form') required String dosageForm,
  }) = _Medicine;

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);
}
