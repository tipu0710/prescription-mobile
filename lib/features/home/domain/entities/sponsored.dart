import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsored.freezed.dart';
part 'sponsored.g.dart';

@freezed
abstract class Sponsored with _$Sponsored {
  const factory Sponsored({
    required int id,
    required String image,
    required String title,
    required String description,
    @JsonKey(name: 'details_url') required String detailsUrl,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Sponsored;

  factory Sponsored.fromJson(Map<String, dynamic> json) =>
      _$SponsoredFromJson(json);
}
