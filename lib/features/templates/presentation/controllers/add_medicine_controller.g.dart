// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_medicine_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddMedicineController)
const addMedicineControllerProvider = AddMedicineControllerProvider._();

final class AddMedicineControllerProvider
    extends $NotifierProvider<AddMedicineController, AddMedicineState> {
  const AddMedicineControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addMedicineControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addMedicineControllerHash();

  @$internal
  @override
  AddMedicineController create() => AddMedicineController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddMedicineState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddMedicineState>(value),
    );
  }
}

String _$addMedicineControllerHash() =>
    r'7d70a9f8145687d1149ed346b1f710b3e0aa3588';

abstract class _$AddMedicineController extends $Notifier<AddMedicineState> {
  AddMedicineState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddMedicineState, AddMedicineState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddMedicineState, AddMedicineState>,
              AddMedicineState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
