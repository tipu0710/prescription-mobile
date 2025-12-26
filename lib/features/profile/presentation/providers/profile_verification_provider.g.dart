// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_verification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileVerification)
const profileVerificationProvider = ProfileVerificationProvider._();

final class ProfileVerificationProvider
    extends $AsyncNotifierProvider<ProfileVerification, bool> {
  const ProfileVerificationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileVerificationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileVerificationHash();

  @$internal
  @override
  ProfileVerification create() => ProfileVerification();
}

String _$profileVerificationHash() =>
    r'a92c2be6a33fe346435b6e4100ce538e0e3c1c2f';

abstract class _$ProfileVerification extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
