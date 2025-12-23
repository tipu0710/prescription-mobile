// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_resend_timer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OtpResendTimer)
const otpResendTimerProvider = OtpResendTimerProvider._();

final class OtpResendTimerProvider
    extends $NotifierProvider<OtpResendTimer, int> {
  const OtpResendTimerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'otpResendTimerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$otpResendTimerHash();

  @$internal
  @override
  OtpResendTimer create() => OtpResendTimer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$otpResendTimerHash() => r'6e04b90415cceb4f663426e0b47774537bbcae3b';

abstract class _$OtpResendTimer extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
