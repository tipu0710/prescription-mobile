// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_verification_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OtpVerificationController)
const otpVerificationControllerProvider = OtpVerificationControllerProvider._();

final class OtpVerificationControllerProvider
    extends $AsyncNotifierProvider<OtpVerificationController, void> {
  const OtpVerificationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'otpVerificationControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$otpVerificationControllerHash();

  @$internal
  @override
  OtpVerificationController create() => OtpVerificationController();
}

String _$otpVerificationControllerHash() =>
    r'ce77de1543c78d670e00a98fc50f36723fbd07fb';

abstract class _$OtpVerificationController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
