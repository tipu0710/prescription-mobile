// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chambers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Chambers)
const chambersProvider = ChambersProvider._();

final class ChambersProvider
    extends $AsyncNotifierProvider<Chambers, List<Chamber>> {
  const ChambersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chambersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chambersHash();

  @$internal
  @override
  Chambers create() => Chambers();
}

String _$chambersHash() => r'ad3f2ee7455c0fd25351ed18d0c2261b31239efd';

abstract class _$Chambers extends $AsyncNotifier<List<Chamber>> {
  FutureOr<List<Chamber>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Chamber>>, List<Chamber>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Chamber>>, List<Chamber>>,
              AsyncValue<List<Chamber>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
