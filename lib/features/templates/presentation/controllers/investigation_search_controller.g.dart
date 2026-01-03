// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investigation_search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InvestigationSearchController)
const investigationSearchControllerProvider =
    InvestigationSearchControllerProvider._();

final class InvestigationSearchControllerProvider
    extends
        $AsyncNotifierProvider<
          InvestigationSearchController,
          List<Investigation>
        > {
  const InvestigationSearchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'investigationSearchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$investigationSearchControllerHash();

  @$internal
  @override
  InvestigationSearchController create() => InvestigationSearchController();
}

String _$investigationSearchControllerHash() =>
    r'a734ab6874d2b1803de841d1cffe664c212ba693';

abstract class _$InvestigationSearchController
    extends $AsyncNotifier<List<Investigation>> {
  FutureOr<List<Investigation>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Investigation>>, List<Investigation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Investigation>>, List<Investigation>>,
              AsyncValue<List<Investigation>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
