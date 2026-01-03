import 'dart:async';
import 'package:babosthapotro/core/utils/debouncer.dart';
import 'package:babosthapotro/features/home/data/repositories/home_repository.dart';
import 'package:babosthapotro/features/home/domain/entities/medicine.dart';
import 'package:babosthapotro/features/templates/presentation/controllers/add_medicine_controller.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class MedicineSearchSection extends ConsumerStatefulWidget {
  final FocusNode dosageFocus;

  const MedicineSearchSection({super.key, required this.dosageFocus});

  @override
  ConsumerState<MedicineSearchSection> createState() =>
      _MedicineSearchSectionState();
}

class _MedicineSearchSectionState extends ConsumerState<MedicineSearchSection> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();

    // Initialize text
    final selectedMedicine = ref.read(
      addMedicineControllerProvider.select((value) => value.selectedMedicine),
    );
    if (selectedMedicine != null) {
      _controller.text = _displayStringForOption(selectedMedicine);
    } else {
      _controller.text = ref.read(
        addMedicineControllerProvider.select((value) => value.searchQuery),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  String _displayStringForOption(Medicine option) =>
      '${option.brandName} - ${option.strength} (${option.dosageForm})';

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;
    final state = ref.watch(addMedicineControllerProvider);

    // If a medicine is selected, show it in readonly mode
    // This switches the widget in the tree, which is why we need addPostFrameCallback in onSelected
    // Use RawAutocomplete always to prevent unmounting issues

    ref.listen(addMedicineControllerProvider, (previous, next) {
      if (previous?.selectedMedicine != next.selectedMedicine ||
          previous?.searchQuery != next.searchQuery) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          if (next.selectedMedicine != null) {
            final expected = _displayStringForOption(next.selectedMedicine!);
            if (_controller.text != expected) {
              _controller.text = expected;
            }
          } else if (_controller.text != next.searchQuery &&
              next.searchQuery.isEmpty) {
            _controller.text = next.searchQuery;
          }
        });
      }
    });

    return RawAutocomplete<Medicine>(
      textEditingController: _controller,
      focusNode: _focusNode,
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) async {
        final query = textEditingValue.text;

        if (query.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && state.hasSearchResults) {
              ref
                  .read(addMedicineControllerProvider.notifier)
                  .setHasSearchResults(false);
            }
          });
          return const Iterable<Medicine>.empty();
        }

        final completer = Completer<List<Medicine>>();

        _debouncer.run(() async {
          final response = await ref
              .read(homeRepositoryProvider)
              .getMedicines(search: query);

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              final hasResults = response.isNotEmpty;
              if (state.hasSearchResults != hasResults) {
                ref
                    .read(addMedicineControllerProvider.notifier)
                    .setHasSearchResults(hasResults);
              }
            }
          });
          completer.complete(response);
        });

        return completer.future;
      },
      optionsViewBuilder: (context, onSelected, options) {
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
                maxHeight: 300,
                maxWidth: MediaQuery.of(context).size.width - 32,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${option.brandName} (${option.strength})',
                            style: context.textStyle.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colors.foreground,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            '${option.genericName} - ${option.manufacturer}',
                            style: context.textStyle.bodySmall.copyWith(
                              color: colors.mutedForeground,
                            ),
                          ),
                          const Gap(2),
                          Text(
                            option.dosageForm,
                            style: context.textStyle.bodySmall.copyWith(
                              color: colors.mutedForeground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
      onSelected: (Medicine selection) {
        // No need for addPostFrameCallback if we don't unmount the widget!
        ref
            .read(addMedicineControllerProvider.notifier)
            .onMedicineSelected(selection);
        widget.dosageFocus.requestFocus();
      },
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        return CustomTextFormField(
          controller: controller, // This is _controller
          focusNode: focusNode,
          hintText: 'Brand Name (e.g. Napa)',
          textInputAction: TextInputAction.next,
          readOnly: state.selectedMedicine != null,
          suffixIcon: state.selectedMedicine != null
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    // Clear selection and reset form
                    ref.read(addMedicineControllerProvider.notifier).reset();
                    controller.clear();
                  },
                )
              : null,
          onChanged: (val) {
            ref
                .read(addMedicineControllerProvider.notifier)
                .onSearchQueryChanged(val);
          },
          validator: (v) => v!.isEmpty ? 'Required' : null,
        );
      },
    );
  }
}
