import 'package:freezed_annotation/freezed_annotation.dart';

part 'degree.freezed.dart';
part 'degree.g.dart';

@freezed
abstract class Degree with _$Degree {
  const factory Degree({
    required int id,
    @JsonKey(name: 'degree_name') required String degreeName,
    @JsonKey(name: 'degree_name_local') required String degreeNameLocal,
    @JsonKey(name: 'field_of_study') required String fieldOfStudy,
    @JsonKey(name: 'field_of_study_local') required String fieldOfStudyLocal,
    required String institution,
    @JsonKey(name: 'institution_local') required String institutionLocal,
  }) = _Degree;

  factory Degree.fromJson(Map<String, dynamic> json) => _$DegreeFromJson(json);
}
