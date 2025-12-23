import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_reset_confirm_request_model.freezed.dart';
part 'password_reset_confirm_request_model.g.dart';

@freezed
abstract class PasswordResetConfirmRequestModel with _$PasswordResetConfirmRequestModel {
  const factory PasswordResetConfirmRequestModel({
    required String email,
    required String code,
    @JsonKey(name: 'new_password') required String newPassword,
  }) = _PasswordResetConfirmRequestModel;

  factory PasswordResetConfirmRequestModel.fromJson(
    Map<String, dynamic> json,
  ) => _$PasswordResetConfirmRequestModelFromJson(json);
}
