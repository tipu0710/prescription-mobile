import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_request.freezed.dart';
part 'verification_request.g.dart';

@freezed
abstract class VerificationRequest with _$VerificationRequest {
  factory VerificationRequest({required String email, required String code}) =
      _VerificationRequest;

  factory VerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$VerificationRequestFromJson(json);
}
