import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_params.freezed.dart';

@freezed
abstract class SignupParams with _$SignupParams {
  factory SignupParams({
    required String email,
    required String bmdcNumber,
    required String password,
  }) = _SignupParams;
}
