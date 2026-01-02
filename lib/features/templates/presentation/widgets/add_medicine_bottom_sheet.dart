import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/features/home/domain/entities/medicine.dart';
import 'package:babosthapotro/features/home/data/repositories/home_repository.dart';
import '../../data/repositories/templates_repository_impl.dart';
import '../models/ui_medicine.dart';

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
  Medicine? _selectedMedicine;
  final _dosageController = TextEditingController();
  final _takingTimeController = TextEditingController();
  final _durationController = TextEditingController();
  final _routeController = TextEditingController();
  final _instructionController = TextEditingController();
  final _volumeController = TextEditingController();

  // Source of truth for suggestions (unfiltered)
  List<String> _sourceDosages = [];
  List<String> _sourceTakingTimes = [];
  List<String> _sourceRoutes = [];
  List<String> _sourceInstructions = [];
  List<String> _sourceDurations = [];

  // Displayed suggestions (filtered)

  List<String> _suggestedTakingTimes = [];
  List<String> _suggestedRoutes = [];
  List<String> _suggestedInstructions = [];
  List<String> _suggestedDurations = [];

  // Common routes (Fallback)
  final List<String> _allRoutes = [
    'Oral',
    'IV',
    'IM',
    'SC',
    'Topical',
    'Ophthalmic',
    'Nasal',
    'Otic',
    'Rectal',
    'Vaginal',
    'Inhalation',
  ];

  @override
  void initState() {
    super.initState();
    _takingTimeController.addListener(_filterTakingTimes);
    _durationController.addListener(_filterDurations);
    _routeController.addListener(_filterRoutes);
    _instructionController.addListener(_filterInstructions);

    if (widget.initialMedicine != null) {
      final m = widget.initialMedicine!;
      _selectedMedicine = m.medicine;
      _dosageController.text = m.dosage;
      _takingTimeController.text = m.takingTime;
      _durationController.text = m.duration;
      _routeController.text = m.route;
      _instructionController.text = m.instruction;
      if (m.volume != null) {
        _volumeController.text = m.volume!;
      }

      // Post-frame callback to load suggestions for the selected medicine
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateSuggestions(m.medicine);
      });
    }
  }

  @override
  void dispose() {
    _takingTimeController.removeListener(_filterTakingTimes);
    _durationController.removeListener(_filterDurations);
    _routeController.removeListener(_filterRoutes);
    _instructionController.removeListener(_filterInstructions);
    _instructionController.removeListener(_filterInstructions);
    _dosageController.dispose();
    _takingTimeController.dispose();
    _durationController.dispose();
    _routeController.dispose();
    _instructionController.dispose();
    _volumeController.dispose();
    super.dispose();
  }

  // Helper to convert English digits to Bangla
  String _toBangla(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const bangla = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    for (int i = 0; i < 10; i++) {
      input = input.replaceAll(english[i], bangla[i]);
    }
    return input;
  }

  int _matchScore(
    String source,
    String query,
    String queryBangla,
    String queryDigitsOnly,
    String queryBanglaDigitsOnly,
  ) {
    final sLower = source.toLowerCase();

    // 1. Exact match (Highest Priority)
    if (sLower == query || sLower == queryBangla) {
      return 3;
    }

    // 2. Smart Digit Exact match
    if (queryDigitsOnly.isNotEmpty) {
      final sDigitsOnly = sLower.replaceAll(RegExp(r'[^0-9০-৯]'), '');
      // Equality check
      if (sDigitsOnly == queryDigitsOnly ||
          sDigitsOnly == queryBanglaDigitsOnly) {
        return 3;
      }
      // Partial digit match
      if (sDigitsOnly.contains(queryDigitsOnly) ||
          sDigitsOnly.contains(queryBanglaDigitsOnly)) {
        return 2;
      }
    }

    // 3. Contains match
    if (sLower.contains(query) || sLower.contains(queryBangla)) {
      return 2;
    }

    return 0;
  }

  List<String> _sortSuggestions(
    List<String> source,
    String query, {
    bool strict = false,
  }) {
    final qLower = query.toLowerCase();
    final qDigitsOnly = qLower.replaceAll(RegExp(r'[^0-9০-৯]'), '');
    final qBangla = _toBangla(qLower);
    final qBanglaDigitsOnly = qDigitsOnly.isNotEmpty
        ? _toBangla(qDigitsOnly)
        : '';

    // Map to list of objects with index to preserve stability
    List<MapEntry<int, String>> items = source.asMap().entries.toList();

    items.sort((a, b) {
      int scoreA = _matchScore(
        a.value,
        qLower,
        qBangla,
        qDigitsOnly,
        qBanglaDigitsOnly,
      );
      int scoreB = _matchScore(
        b.value,
        qLower,
        qBangla,
        qDigitsOnly,
        qBanglaDigitsOnly,
      );

      if (strict) {
        if (scoreA == 2) scoreA = 0;
        if (scoreB == 2) scoreB = 0;
      }

      if (scoreA != scoreB) {
        return scoreB.compareTo(scoreA); // Descending Score
      }
      return a.key.compareTo(b.key); // Ascending Index (Stable)
    });

    return items.map((e) => e.value).toList();
  }

  void _filterTakingTimes() {
    setState(() {
      _suggestedTakingTimes = _sortSuggestions(
        _sourceTakingTimes,
        _takingTimeController.text,
      );
    });
  }

  void _filterDurations() {
    setState(() {
      _suggestedDurations = _sortSuggestions(
        _sourceDurations,
        _durationController.text,
        strict: true,
      );
    });
  }

  void _filterRoutes() {
    final allRelevant = {..._sourceRoutes, ..._allRoutes}.toList();
    setState(() {
      _suggestedRoutes = _sortSuggestions(allRelevant, _routeController.text);
    });
  }

  void _filterInstructions() {
    setState(() {
      _suggestedInstructions = _sortSuggestions(
        _sourceInstructions,
        _instructionController.text,
      );
    });
  }

  void _updateSuggestions(Medicine medicine, {bool clearValues = false}) {
    final repository = ref.read(templatesRepositoryProvider);
    final suggestions = repository.getDosageSuggestions(
      dosageForm: medicine.dosageForm,
      genericName: medicine.genericName,
      lang: 'bn',
    );

    final durations = repository.getDurationSuggestions('bn');

    // Clear values if requested (meaning new medicine selected manually)
    if (clearValues) {
      _dosageController.clear();
      _takingTimeController.clear();
      _durationController.clear();
      _instructionController.clear();
      _volumeController.clear();
      _routeController.clear();
    }

    setState(() {
      _sourceDosages = suggestions.dosages;
      _sourceTakingTimes = suggestions.takingTimes;
      _sourceRoutes = suggestions.routes;
      _sourceInstructions = suggestions.notes;
      _sourceDurations = durations;

      _suggestedTakingTimes = _sourceTakingTimes;
      _suggestedRoutes = _sourceRoutes;
      _suggestedInstructions = _sourceInstructions;
      _suggestedDurations = _sourceDurations;

      if (_sourceRoutes.isNotEmpty) {
        if (_sourceRoutes.length == 1) {
          _routeController.text = _sourceRoutes.first;
        }
      } else {
        if (_routeController.text.isEmpty &&
            repository.isOralDosageForm(medicine.dosageForm)) {
          _routeController.text = 'Oral';
        }
      }

      // Trigger filters

      _filterTakingTimes();
      _filterDurations();
      _filterRoutes();
      _filterInstructions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;
    final repository = ref.watch(templatesRepositoryProvider);

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
              Text('Add Medicine', style: context.textStyle.headlineSmall),
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
                    if (widget.initialMedicine != null &&
                        _selectedMedicine != null)
                      CustomTextFormField(
                        controller: TextEditingController(
                          text:
                              '${_selectedMedicine!.brandName} - ${_selectedMedicine!.strength} (${_selectedMedicine!.dosageForm})',
                        ),
                        readOnly: true,
                        hintText: 'Medicine',
                      )
                    else
                      Autocomplete<Medicine>(
                        displayStringForOption: (Medicine option) =>
                            '${option.brandName} - ${option.strength} (${option.dosageForm})',
                        optionsBuilder:
                            (TextEditingValue textEditingValue) async {
                              if (textEditingValue.text.length < 2) {
                                return const Iterable<Medicine>.empty();
                              }
                              final response = await ref
                                  .read(homeRepositoryProvider)
                                  .getMedicines(search: textEditingValue.text);
                              return response;
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
                                  maxWidth:
                                      MediaQuery.of(context).size.width -
                                      32, // Padding
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${option.brandName} (${option.strength})',
                                              style: context.textStyle.bodyLarge
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: colors.foreground,
                                                  ),
                                            ),
                                            const Gap(4),
                                            Text(
                                              '${option.genericName} - ${option.manufacturer}',
                                              style: context.textStyle.bodySmall
                                                  .copyWith(
                                                    color:
                                                        colors.mutedForeground,
                                                  ),
                                            ),
                                            const Gap(2),
                                            Text(
                                              option.dosageForm,
                                              style: context.textStyle.bodySmall
                                                  .copyWith(
                                                    color:
                                                        colors.mutedForeground,
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
                          setState(() => _selectedMedicine = selection);
                          _updateSuggestions(selection, clearValues: true);
                        },
                        fieldViewBuilder:
                            (
                              context,
                              controller,
                              focusNode,
                              onEditingComplete,
                            ) {
                              return CustomTextFormField(
                                controller: controller,
                                focusNode: focusNode,
                                onEditingComplete: onEditingComplete,
                                hintText: 'Search Medicine',
                                suffixIcon: const Icon(Icons.search),
                              );
                            },
                      ),
                    const Gap(16),

                    if (_selectedMedicine != null) ...[
                      // If infusion, show volume field
                      if (repository.isInfusion(
                        _selectedMedicine!.dosageForm,
                      )) ...[
                        Text('Volume', style: context.textStyle.labelLarge),
                        const Gap(8),
                        Autocomplete<String>(
                          optionsBuilder: (textEditingValue) {
                            final volumes = repository.getInfusionVolumes();
                            if (textEditingValue.text.isEmpty) {
                              return volumes;
                            }
                            return volumes.where(
                              (v) => v.toLowerCase().contains(
                                textEditingValue.text.toLowerCase(),
                              ),
                            );
                          },
                          onSelected: (value) {
                            _volumeController.text = value;
                          },
                          fieldViewBuilder:
                              (
                                context,
                                controller,
                                focusNode,
                                onEditingComplete,
                              ) {
                                if (_volumeController.text != controller.text) {
                                  controller.text = _volumeController.text;
                                }
                                // Sync controller with _volumeController
                                controller.addListener(() {
                                  _volumeController.text = controller.text;
                                });

                                return CustomTextFormField(
                                  controller: controller,
                                  focusNode: focusNode,
                                  onEditingComplete: onEditingComplete,
                                  hintText: 'e.g. 500ml',
                                );
                              },
                        ),
                        const Gap(16),
                      ],

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dosage',
                                  style: context.textStyle.labelLarge,
                                ),
                                const Gap(8),
                                Autocomplete<String>(
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text.isEmpty) {
                                      return _sourceDosages;
                                    }
                                    return _sourceDosages.where(
                                      (d) => d.contains(textEditingValue.text),
                                    );
                                  },
                                  onSelected: (value) {
                                    _dosageController.text = value;
                                  },
                                  fieldViewBuilder:
                                      (
                                        context,
                                        controller,
                                        focusNode,
                                        onEditingComplete,
                                      ) {
                                        if (_dosageController.text !=
                                            controller.text) {
                                          controller.text =
                                              _dosageController.text;
                                        }
                                        controller.addListener(() {
                                          _dosageController.text =
                                              controller.text;
                                        });
                                        return CustomTextFormField(
                                          controller: controller,
                                          focusNode: focusNode,
                                          onEditingComplete: onEditingComplete,
                                          hintText: 'e.g. 1+0+1',
                                          validator: (v) =>
                                              v == null || v.isEmpty
                                              ? 'Required'
                                              : null,
                                        );
                                      },
                                ),
                              ],
                            ),
                          ),
                          const Gap(16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Taking Time',
                                  style: context.textStyle.labelLarge,
                                ),
                                const Gap(8),
                                Autocomplete<String>(
                                  optionsBuilder: (textEditingValue) {
                                    return _suggestedTakingTimes;
                                  },
                                  onSelected: (value) {
                                    _takingTimeController.text = value;
                                  },
                                  fieldViewBuilder:
                                      (
                                        context,
                                        controller,
                                        focusNode,
                                        onEditingComplete,
                                      ) {
                                        if (_takingTimeController.text !=
                                            controller.text) {
                                          controller.text =
                                              _takingTimeController.text;
                                        }
                                        controller.addListener(() {
                                          _takingTimeController.text =
                                              controller.text;
                                        });
                                        return CustomTextFormField(
                                          controller: controller,
                                          focusNode: focusNode,
                                          onEditingComplete: onEditingComplete,
                                          hintText: 'e.g. After meal',
                                        );
                                      },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),

                      Text('Duration', style: context.textStyle.labelLarge),
                      const Gap(8),
                      Autocomplete<String>(
                        optionsBuilder: (textEditingValue) {
                          return _suggestedDurations;
                        },
                        onSelected: (value) {
                          _durationController.text = value;
                        },
                        fieldViewBuilder:
                            (
                              context,
                              controller,
                              focusNode,
                              onEditingComplete,
                            ) {
                              if (_durationController.text != controller.text) {
                                controller.text = _durationController.text;
                              }
                              controller.addListener(() {
                                _durationController.text = controller.text;
                              });
                              return CustomTextFormField(
                                controller: controller,
                                focusNode: focusNode,
                                onEditingComplete: onEditingComplete,
                                hintText: 'e.g. 7 days',
                                validator: (v) =>
                                    v == null || v.isEmpty ? 'Required' : null,
                              );
                            },
                      ),
                      const Gap(16),

                      if (!repository.isSuppository(
                        _selectedMedicine!.dosageForm,
                      )) ...[
                        Text('Route', style: context.textStyle.labelLarge),
                        const Gap(8),
                        Autocomplete<String>(
                          optionsBuilder: (textEditingValue) {
                            return _suggestedRoutes;
                          },
                          onSelected: (value) {
                            _routeController.text = value;
                          },
                          fieldViewBuilder:
                              (
                                context,
                                controller,
                                focusNode,
                                onEditingComplete,
                              ) {
                                if (_routeController.text != controller.text) {
                                  controller.text = _routeController.text;
                                }
                                controller.addListener(() {
                                  _routeController.text = controller.text;
                                });
                                return CustomTextFormField(
                                  controller: controller,
                                  focusNode: focusNode,
                                  onEditingComplete: onEditingComplete,
                                  hintText: 'e.g. Oral',
                                  validator: (v) => v == null || v.isEmpty
                                      ? 'Required'
                                      : null,
                                );
                              },
                        ),
                        const Gap(16),
                      ],

                      Text('Instruction', style: context.textStyle.labelLarge),
                      const Gap(8),
                      Autocomplete<String>(
                        optionsBuilder: (textEditingValue) {
                          return _suggestedInstructions;
                        },
                        onSelected: (value) {
                          _instructionController.text = value;
                        },
                        fieldViewBuilder:
                            (
                              context,
                              controller,
                              focusNode,
                              onEditingComplete,
                            ) {
                              if (_instructionController.text !=
                                  controller.text) {
                                controller.text = _instructionController.text;
                              }
                              controller.addListener(() {
                                _instructionController.text = controller.text;
                              });
                              return CustomTextFormField(
                                controller: controller,
                                focusNode: focusNode,
                                onEditingComplete: onEditingComplete,
                                hintText: 'e.g. Shake well',
                              );
                            },
                      ),
                      const Gap(12),
                      // Filter instruction chips logic
                      if (_suggestedInstructions.isNotEmpty) ...[
                        const Gap(8),
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _suggestedInstructions.length,
                            separatorBuilder: (_, _) => const Gap(8),
                            itemBuilder: (context, index) {
                              final note = _suggestedInstructions[index];
                              // Check if instruction contains note
                              final isSelected = _instructionController.text
                                  .contains(note);
                              return ActionChip(
                                label: Text(
                                  note,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : null,
                                  ),
                                ),
                                onPressed: () {
                                  if (isSelected) {
                                    if (_instructionController.text.contains(
                                      ', $note',
                                    )) {
                                      _instructionController.text =
                                          _instructionController.text
                                              .replaceAll(', $note', '');
                                    } else if (_instructionController.text
                                        .contains('$note, ')) {
                                      _instructionController.text =
                                          _instructionController.text
                                              .replaceAll('$note, ', '');
                                    } else {
                                      _instructionController.text =
                                          _instructionController.text
                                              .replaceAll(note, '');
                                    }
                                  } else {
                                    if (_instructionController.text.isEmpty) {
                                      _instructionController.text = note;
                                    } else {
                                      _instructionController.text =
                                          '${_instructionController.text}, $note';
                                    }
                                  }

                                  _instructionController
                                      .selection = TextSelection.fromPosition(
                                    TextPosition(
                                      offset:
                                          _instructionController.text.length,
                                    ),
                                  );
                                },
                                backgroundColor: isSelected
                                    ? colors.primary
                                    : colors.card,
                                side: BorderSide(
                                  color: isSelected
                                      ? colors.primary
                                      : colors.border,
                                ),
                              );
                            },
                          ),
                        ),
                      ],

                      const Gap(24),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final medicine = UiMedicine(
                                medicine: _selectedMedicine!,
                                volume: _volumeController.text.isNotEmpty
                                    ? _volumeController.text
                                    : null,
                                dosage: _dosageController.text,
                                takingTime: _takingTimeController.text,
                                duration: _durationController.text,
                                route: _routeController.text,
                                instruction: _instructionController.text,
                              );
                              Navigator.pop(context, medicine);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors.primary,
                            foregroundColor: colors.onPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Add Medicine'),
                        ),
                      ),
                      const Gap(40), // Bottom padding
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
