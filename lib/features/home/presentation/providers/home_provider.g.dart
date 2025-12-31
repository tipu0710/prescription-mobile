// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sponsored)
const sponsoredProvider = SponsoredProvider._();

final class SponsoredProvider
    extends
        $FunctionalProvider<
          AsyncValue<Sponsored>,
          Sponsored,
          FutureOr<Sponsored>
        >
    with $FutureModifier<Sponsored>, $FutureProvider<Sponsored> {
  const SponsoredProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sponsoredProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sponsoredHash();

  @$internal
  @override
  $FutureProviderElement<Sponsored> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Sponsored> create(Ref ref) {
    return sponsored(ref);
  }
}

String _$sponsoredHash() => r'88b76a4b481fe79ea64c78a5085f3a126c97999e';
