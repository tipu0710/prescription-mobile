import 'package:freezed_annotation/freezed_annotation.dart';

part 'missing_investigation.freezed.dart';
part 'missing_investigation.g.dart';

@freezed
abstract class MissingInvestigation with _$MissingInvestigation {
  const factory MissingInvestigation({required String name}) =
      _MissingInvestigation;

  factory MissingInvestigation.fromJson(Map<String, dynamic> json) =>
      _$MissingInvestigationFromJson(json);
}
