// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TemplateList)
const templateListProvider = TemplateListFamily._();

final class TemplateListProvider
    extends
        $AsyncNotifierProvider<
          TemplateList,
          PaginatedResponse<PrescriptionTemplate>
        > {
  const TemplateListProvider._({
    required TemplateListFamily super.from,
    required ({String? search, int? page}) super.argument,
  }) : super(
         retry: null,
         name: r'templateListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$templateListHash();

  @override
  String toString() {
    return r'templateListProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TemplateList create() => TemplateList();

  @override
  bool operator ==(Object other) {
    return other is TemplateListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$templateListHash() => r'172b66eccb81552742ca171da57696d181ec1972';

final class TemplateListFamily extends $Family
    with
        $ClassFamilyOverride<
          TemplateList,
          AsyncValue<PaginatedResponse<PrescriptionTemplate>>,
          PaginatedResponse<PrescriptionTemplate>,
          FutureOr<PaginatedResponse<PrescriptionTemplate>>,
          ({String? search, int? page})
        > {
  const TemplateListFamily._()
    : super(
        retry: null,
        name: r'templateListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TemplateListProvider call({String? search, int? page}) =>
      TemplateListProvider._(
        argument: (search: search, page: page),
        from: this,
      );

  @override
  String toString() => r'templateListProvider';
}

abstract class _$TemplateList
    extends $AsyncNotifier<PaginatedResponse<PrescriptionTemplate>> {
  late final _$args = ref.$arg as ({String? search, int? page});
  String? get search => _$args.search;
  int? get page => _$args.page;

  FutureOr<PaginatedResponse<PrescriptionTemplate>> build({
    String? search,
    int? page,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(search: _$args.search, page: _$args.page);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<PaginatedResponse<PrescriptionTemplate>>,
              PaginatedResponse<PrescriptionTemplate>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaginatedResponse<PrescriptionTemplate>>,
                PaginatedResponse<PrescriptionTemplate>
              >,
              AsyncValue<PaginatedResponse<PrescriptionTemplate>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

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
