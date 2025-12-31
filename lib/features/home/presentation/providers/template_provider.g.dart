// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TemplateListNotifier)
const templateListProvider = TemplateListNotifierProvider._();

final class TemplateListNotifierProvider
    extends
        $AsyncNotifierProvider<
          TemplateListNotifier,
          PaginatedResponse<PrescriptionTemplate>
        > {
  const TemplateListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'templateListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$templateListNotifierHash();

  @$internal
  @override
  TemplateListNotifier create() => TemplateListNotifier();
}

String _$templateListNotifierHash() =>
    r'894d824854361aff9aabfe0c021d944bb1fc3f5f';

abstract class _$TemplateListNotifier
    extends $AsyncNotifier<PaginatedResponse<PrescriptionTemplate>> {
  FutureOr<PaginatedResponse<PrescriptionTemplate>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
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
