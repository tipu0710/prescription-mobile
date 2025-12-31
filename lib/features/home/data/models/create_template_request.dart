import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_template_request.freezed.dart';
part 'create_template_request.g.dart';

@freezed
abstract class CreateTemplateMedicine with _$CreateTemplateMedicine {
  const factory CreateTemplateMedicine({
    @JsonKey(name: 'medicine_id') required int medicineId,
    required String dosage,
    @JsonKey(name: 'taking_time') required String takingTime,
    required String duration,
    required String route,
    required String instruction,
  }) = _CreateTemplateMedicine;

  factory CreateTemplateMedicine.fromJson(Map<String, dynamic> json) =>
      _$CreateTemplateMedicineFromJson(json);
}

@freezed
abstract class CreateTemplateRequest with _$CreateTemplateRequest {
  const factory CreateTemplateRequest({
    required String name,
    required List<CreateTemplateMedicine> medicines,
    required List<int> investigations,
    required String? advice,
    @JsonKey(name: 'next_follow_up') String? nextFollowUp,
  }) = _CreateTemplateRequest;

  factory CreateTemplateRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTemplateRequestFromJson(json);
}
