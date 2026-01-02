import 'package:babosthapotro/features/templates/data/datasources/dosage_data_source.dart';
import 'package:babosthapotro/features/templates/presentation/controllers/add_medicine_controller.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class DosageRouteSection extends ConsumerStatefulWidget {
  final FocusNode dosageFocus;
  final FocusNode takingTimeFocus;
  final FocusNode durationFocus;
  final FocusNode routeFocus;
  final FocusNode instructionFocus;
  final FocusNode volumeFocus;

  const DosageRouteSection({
    super.key,
    required this.dosageFocus,
    required this.takingTimeFocus,
    required this.durationFocus,
    required this.routeFocus,
    required this.instructionFocus,
    required this.volumeFocus,
  });

  @override
  ConsumerState<DosageRouteSection> createState() => _DosageRouteSectionState();
}

class _DosageRouteSectionState extends ConsumerState<DosageRouteSection> {
  final _dosageController = TextEditingController();
  final _takingTimeController = TextEditingController();
  final _durationController = TextEditingController();
  final _routeController = TextEditingController();
  final _instructionController = TextEditingController();
  final _volumeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = ref.read(addMedicineControllerProvider);
    _dosageController.text = state.dosage;
    _takingTimeController.text = state.takingTime;
    _durationController.text = state.duration;
    _routeController.text = state.route;
    _instructionController.text = state.instruction;
    _volumeController.text = state.volume;
  }

  @override
  void dispose() {
    _dosageController.dispose();
    _takingTimeController.dispose();
    _durationController.dispose();
    _routeController.dispose();
    _instructionController.dispose();
    _volumeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;
    final state = ref.watch(addMedicineControllerProvider);
    final notifier = ref.read(addMedicineControllerProvider.notifier);

    // Sync controllers using listener to avoid setState during build
    ref.listen(addMedicineControllerProvider, (previous, next) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (_dosageController.text != next.dosage) {
          _dosageController.text = next.dosage;
        }
        if (_takingTimeController.text != next.takingTime) {
          _takingTimeController.text = next.takingTime;
        }
        if (_durationController.text != next.duration) {
          if (!_durationController.selection.isValid) {
            _durationController.text = next.duration;
            _durationController.selection = TextSelection.fromPosition(
              TextPosition(offset: next.duration.length),
            );
          } else if (_durationController.text != next.duration) {
            // If update comes from outside (chips), update text
            _durationController.text = next.duration;
          }
        }
        if (_routeController.text != next.route) {
          _routeController.text = next.route;
        }
        if (_instructionController.text != next.instruction) {
          _instructionController.text = next.instruction;
        }
        if (_volumeController.text != next.volume) {
          _volumeController.text = next.volume;
        }
      });
    });

    final dosageForm = state.dosageForm.isNotEmpty
        ? state.dosageForm
        : (state.selectedMedicine?.dosageForm ?? '');
    final bIsInfusion = isInfusion(dosageForm);
    final bIsOral = isOralDosageForm(dosageForm);
    final bIsSuppository = isSuppository(dosageForm);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (bIsInfusion) ...[
          CustomTextFormField(
            controller: _volumeController,
            focusNode: widget.volumeFocus,
            hintText: 'Volume (e.g. 1L)',
            textInputAction: TextInputAction.next,
            onChanged: notifier.onVolumeChanged,
          ),
          if (infusionVolumes.isNotEmpty) ...[
            const Gap(8),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: infusionVolumes.length,
                separatorBuilder: (_, _) => const Gap(8),
                itemBuilder: (context, index) {
                  final vol = infusionVolumes[index];
                  final isSelected = state.volume == vol;
                  return ActionChip(
                    label: Text(
                      vol,
                      style: TextStyle(color: isSelected ? Colors.white : null),
                    ),
                    onPressed: () {
                      if (isSelected) {
                        notifier.onVolumeChanged('');
                      } else {
                        notifier.onVolumeChanged(vol);
                        widget.dosageFocus.requestFocus();
                      }
                    },
                    backgroundColor: isSelected ? colors.primary : colors.card,
                    side: BorderSide(
                      color: isSelected ? colors.primary : colors.border,
                    ),
                  );
                },
              ),
            ),
          ],
          const Gap(12),
        ],

        // Dosage Autocomplete
        LayoutBuilder(
          builder: (context, constraints) {
            return RawAutocomplete<String>(
              textEditingController: _dosageController,
              focusNode: widget.dosageFocus,
              optionsBuilder: (TextEditingValue textEditingValue) {
                return notifier.getDosageMatches(
                  textEditingValue.text,
                  bIsInfusion,
                );
              },
              onSelected: (String selection) {
                notifier.onDosageChanged(selection);
                if (bIsOral) {
                  widget.takingTimeFocus.requestFocus();
                } else {
                  widget.durationFocus.requestFocus();
                }
              },
              fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
                return CustomTextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  hintText: bIsInfusion
                      ? 'Route + Dosage'
                      : 'Dosage (e.g. 1+0+1)',
                  textInputAction: TextInputAction.next,
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                  onChanged: notifier.onDosageChanged,
                  onEditingComplete: () {
                    // Trigger validation or just move focus?
                    // If we just move focus, RawAutocomplete might not close options?
                    // onEditingComplete(); // Calls autocomplete internal logic
                    // But we want to move focus.
                    if (bIsOral) {
                      widget.takingTimeFocus.requestFocus();
                    } else {
                      widget.durationFocus.requestFocus();
                    }
                  },
                );
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
            );
          },
        ),

        if (bIsOral) ...[
          const Gap(12),
          CustomTextFormField(
            controller: _takingTimeController,
            focusNode: widget.takingTimeFocus,
            textInputAction: TextInputAction.next,
            hintText: 'Taking time (e.g. After meal)',
            onChanged: notifier.onTakingTimeChanged,
          ),
          if (state.sourceTakingTimes.isNotEmpty) ...[
            const Gap(8),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.sourceTakingTimes.length,
                separatorBuilder: (_, _) => const Gap(8),
                itemBuilder: (context, index) {
                  final time = state.sourceTakingTimes[index];
                  final isSelected = state.takingTime == time;
                  return ActionChip(
                    label: Text(
                      time,
                      style: TextStyle(color: isSelected ? Colors.white : null),
                    ),
                    onPressed: () {
                      if (isSelected) {
                        notifier.onTakingTimeChanged('');
                      } else {
                        notifier.onTakingTimeChanged(time);
                        widget.durationFocus.requestFocus();
                      }
                    },
                    backgroundColor: isSelected ? colors.primary : colors.card,
                    side: BorderSide(
                      color: isSelected ? colors.primary : colors.border,
                    ),
                  );
                },
              ),
            ),
          ],
        ],

        const Gap(12),
        CustomTextFormField(
          controller: _durationController,
          focusNode: widget.durationFocus,
          hintText: 'Duration (e.g. 7 days)',
          textInputAction: TextInputAction.next,
          onChanged: notifier.onDurationChanged,
        ),
        if (state.suggestedDurations.isNotEmpty) ...[
          const Gap(8),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.suggestedDurations.length,
              separatorBuilder: (_, _) => const Gap(8),
              itemBuilder: (context, index) {
                final duration = state.suggestedDurations[index];
                final isSelected = state.duration == duration;
                return ActionChip(
                  label: Text(
                    duration,
                    style: TextStyle(color: isSelected ? Colors.white : null),
                  ),
                  onPressed: () {
                    if (isSelected) {
                      notifier.onDurationChanged(''); // Or clear?
                      // Original: clear, then focus
                    } else {
                      notifier.onDurationChanged(duration);
                      if (bIsSuppository) {
                        widget.routeFocus.requestFocus();
                      } else {
                        widget.instructionFocus.requestFocus();
                      }
                    }
                  },
                  backgroundColor: isSelected ? colors.primary : colors.card,
                  side: BorderSide(
                    color: isSelected ? colors.primary : colors.border,
                  ),
                );
              },
            ),
          ),
        ],

        if (bIsSuppository) ...[
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: _routeController,
                  focusNode: widget.routeFocus,
                  textInputAction: TextInputAction.next,
                  hintText: 'Route',
                  onChanged: notifier.onRouteChanged,
                ),
              ),
              if (state.suggestedRoutes.isNotEmpty) ...[
                const Gap(8),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                  onSelected: (String value) {
                    notifier.onRouteChanged(value);
                    widget.instructionFocus.requestFocus();
                  },
                  itemBuilder: (BuildContext context) {
                    return state.suggestedRoutes.map((String choice) {
                      final isSelected = state.route == choice;
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(
                          choice,
                          style: TextStyle(
                            color: isSelected ? colors.primary : null,
                            fontWeight: isSelected ? FontWeight.bold : null,
                          ),
                        ),
                      );
                    }).toList();
                  },
                ),
              ],
            ],
          ),
        ],

        const Gap(12),
        CustomTextFormField(
          controller: _instructionController,
          focusNode: widget.instructionFocus,
          textInputAction: TextInputAction.done,
          hintText: 'Instruction (Optional)',
          onChanged: notifier.onInstructionChanged,
        ),
        if (state.sourceInstructions.isNotEmpty) ...[
          const Gap(8),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.sourceInstructions.length,
              separatorBuilder: (_, _) => const Gap(8),
              itemBuilder: (context, index) {
                final note = state.sourceInstructions[index];
                final isSelected = state.instruction == note;
                return ActionChip(
                  label: Text(
                    note,
                    style: TextStyle(color: isSelected ? Colors.white : null),
                  ),
                  onPressed: () {
                    if (isSelected) {
                      notifier.onInstructionChanged('');
                    } else {
                      notifier.onInstructionChanged(note);
                    }
                  },
                  backgroundColor: isSelected ? colors.primary : colors.card,
                  side: BorderSide(
                    color: isSelected ? colors.primary : colors.border,
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
