import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_params.freezed.dart';

@freezed
abstract class LoginParams with _$LoginParams {
  factory LoginParams({required String credential, required String password}) =
      _LoginParams;
}
