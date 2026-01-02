import 'package:freezed_annotation/freezed_annotation.dart';

part 'investigation.freezed.dart';
part 'investigation.g.dart';

@freezed
abstract class Investigation with _$Investigation {
  const factory Investigation({required int id, required String name}) =
      _Investigation;

  factory Investigation.fromJson(Map<String, dynamic> json) =>
      _$InvestigationFromJson(json);
}
