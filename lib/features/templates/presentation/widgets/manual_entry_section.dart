import 'package:babosthapotro/features/templates/presentation/controllers/add_medicine_controller.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ManualEntrySection extends ConsumerStatefulWidget {
  final FocusNode dosageFocus;
  final FocusNode strengthFocus;
  final FocusNode
  formFocus; // Optional if we want to control focus from outside

  const ManualEntrySection({
    super.key,
    required this.dosageFocus,
    required this.strengthFocus,
    required this.formFocus,
  });

  @override
  ConsumerState<ManualEntrySection> createState() => _ManualEntrySectionState();
}

class _ManualEntrySectionState extends ConsumerState<ManualEntrySection> {
  final _formController = TextEditingController();
  final _strengthController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = ref.read(addMedicineControllerProvider);
    _formController.text = state.dosageForm;
    _strengthController.text = state.strength;

    // Listen to changes?
    // Actually the controller updates `state`, triggering rebuilds. But for TextControllers,
    // it's better if we don't overwrite text on every build unless state changed externally (e.g. selection).
    // But since this section is for manual entry, typing updates controller.
  }

  @override
  void dispose() {
    _formController.dispose();
    _strengthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;
    final state = ref.watch(addMedicineControllerProvider);
    final notifier = ref.read(addMedicineControllerProvider.notifier);

    // Sync controllers if state changed externally (e.g. cleared)
    // Careful with cursor position.
    // Sync controllers using listener
    ref.listen(addMedicineControllerProvider, (previous, next) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (_formController.text != next.dosageForm) {
          _formController.text = next.dosageForm;
        }
        if (_strengthController.text != next.strength) {
          _strengthController.text = next.strength;
        }
      });
    });

    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return RawAutocomplete<String>(
              textEditingController: _formController,
              focusNode: widget.formFocus,
              optionsBuilder: (TextEditingValue textEditingValue) {
                return notifier.filterDosageForms(textEditingValue.text);
              },
              optionsViewBuilder:
                  (
                    BuildContext context,
                    AutocompleteOnSelected<String> onSelected,
                    Iterable<String> options,
                  ) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: colors.card,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 200,
                            maxWidth: constraints.maxWidth,
                          ),
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: options.length,
                            separatorBuilder: (_, _) =>
                                Divider(height: 1, color: colors.border),
                            itemBuilder: (context, index) {
                              final option = options.elementAt(index);
                              return InkWell(
                                onTap: () => onSelected(option),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Text(
                                    option,
                                    style: context.textStyle.bodyMedium,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
              onSelected: (String selection) {
                notifier.onFormChanged(selection);
                widget.strengthFocus.requestFocus();
              },
              fieldViewBuilder:
                  (context, controller, focusNode, onEditingComplete) {
                    return CustomTextFormField(
                      controller:
                          controller, // Used _formController via Autocomplete
                      focusNode: focusNode,
                      hintText: 'Form',
                      textInputAction: TextInputAction.next,
                      validator: (v) =>
                          state.isManualEntry && v!.isEmpty ? 'Required' : null,
                      onChanged: (val) {
                        notifier.onFormChanged(val);
                      },
                      onEditingComplete: () {
                        widget.strengthFocus.requestFocus();
                      },
                    );
                  },
            );
          },
        ),
        const Gap(12),
        CustomTextFormField(
          controller: _strengthController,
          focusNode: widget.strengthFocus,
          hintText: 'Strength',
          textInputAction: TextInputAction.next,
          validator: (v) =>
              state.isManualEntry && v!.isEmpty ? 'Required' : null,
          onChanged: (val) {
            notifier.onStrengthChanged(val);
          },
          onEditingComplete: () {
            widget.dosageFocus.requestFocus();
          },
        ),
      ],
    );
  }
}
