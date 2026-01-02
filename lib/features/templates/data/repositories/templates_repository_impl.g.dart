// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'templates_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(templatesRepository)
const templatesRepositoryProvider = TemplatesRepositoryProvider._();

final class TemplatesRepositoryProvider
    extends
        $FunctionalProvider<
          TemplatesRepository,
          TemplatesRepository,
          TemplatesRepository
        >
    with $Provider<TemplatesRepository> {
  const TemplatesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'templatesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$templatesRepositoryHash();

  @$internal
  @override
  $ProviderElement<TemplatesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TemplatesRepository create(Ref ref) {
    return templatesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TemplatesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TemplatesRepository>(value),
    );
  }
}

String _$templatesRepositoryHash() =>
    r'02e0948eb2b3704e6432d1e7007cbf3c18cc6f93';
