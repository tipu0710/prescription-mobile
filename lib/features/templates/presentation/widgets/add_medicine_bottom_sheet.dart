import 'package:babosthapotro/features/templates/presentation/controllers/add_medicine_controller.dart';
import 'package:babosthapotro/features/templates/presentation/models/ui_medicine.dart';
import 'package:babosthapotro/features/templates/presentation/widgets/dosage_route_section.dart';
import 'package:babosthapotro/features/templates/presentation/widgets/manual_entry_section.dart';
import 'package:babosthapotro/features/templates/presentation/widgets/medicine_search_section.dart';
import 'package:babosthapotro/presentation/widgets/custom_elevated_button.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AddMedicineBottomSheet extends ConsumerStatefulWidget {
  final UiMedicine? initialMedicine;

  const AddMedicineBottomSheet({super.key, this.initialMedicine});

  @override
  ConsumerState<AddMedicineBottomSheet> createState() =>
      _AddMedicineBottomSheetState();
}

class _AddMedicineBottomSheetState
    extends ConsumerState<AddMedicineBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  final _dosageFocus = FocusNode();
  final _takingTimeFocus = FocusNode();
  final _durationFocus = FocusNode();
  final _routeFocus = FocusNode();
  final _instructionFocus = FocusNode();
  final _volumeFocus = FocusNode();
  final _strengthFocus = FocusNode();
  final _formFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(addMedicineControllerProvider.notifier)
          .initialize(widget.initialMedicine);
    });
  }

  @override
  void dispose() {
    _dosageFocus.dispose();
    _takingTimeFocus.dispose();
    _durationFocus.dispose();
    _routeFocus.dispose();
    _instructionFocus.dispose();
    _volumeFocus.dispose();
    _strengthFocus.dispose();
    _formFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addMedicineControllerProvider);
    final notifier = ref.read(addMedicineControllerProvider.notifier);
    
    // Only show manual entry if explicit manual entry OR no search results found while searching.
    // Logic from original: 
    // if (_isManualEntry && (_searchQuery.isEmpty || !_hasSearchResults))
    final showManualEntry = state.isManualEntry && 
        (state.searchQuery.isEmpty || !state.hasSearchResults);

    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.initialMedicine != null
                    ? 'Update Medicine'
                    : 'Add Medicine',
                style: context.textStyle.headlineSmall,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const Gap(16),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MedicineSearchSection(dosageFocus: _dosageFocus),
                    
                    const Gap(12),
                    
                    if (showManualEntry) ...[
                      ManualEntrySection(
                        dosageFocus: _dosageFocus, 
                        strengthFocus: _strengthFocus,
                        formFocus: _formFocus,
                      ),
                      const Gap(12),
                    ],

                    DosageRouteSection(
                      dosageFocus: _dosageFocus,
                      takingTimeFocus: _takingTimeFocus,
                      durationFocus: _durationFocus, 
                      routeFocus: _routeFocus, 
                      instructionFocus: _instructionFocus,
                      volumeFocus: _volumeFocus,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(16),
          CustomElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final result = await notifier.saveMedicine(widget.initialMedicine);
                if (context.mounted) {
                   Navigator.pop(context, result);
                }
              }
            },
            text: widget.initialMedicine != null
                ? 'Update Medicine'
                : 'Add Medicine',
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
