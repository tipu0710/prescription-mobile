// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'degrees_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Degrees)
const degreesProvider = DegreesProvider._();

final class DegreesProvider
    extends $AsyncNotifierProvider<Degrees, List<Degree>> {
  const DegreesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'degreesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$degreesHash();

  @$internal
  @override
  Degrees create() => Degrees();
}

String _$degreesHash() => r'0d4a563e6c8073cff8f3716eff978d432c6f9ecc';

abstract class _$Degrees extends $AsyncNotifier<List<Degree>> {
  FutureOr<List<Degree>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Degree>>, List<Degree>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Degree>>, List<Degree>>,
              AsyncValue<List<Degree>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
