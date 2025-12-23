import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_reset_request_model.freezed.dart';
part 'password_reset_request_model.g.dart';

@freezed
abstract class PasswordResetRequestModel with _$PasswordResetRequestModel {
  const factory PasswordResetRequestModel({required String credential}) =
      _PasswordResetRequestModel;

  factory PasswordResetRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetRequestModelFromJson(json);
}
