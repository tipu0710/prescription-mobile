import 'package:babosthapotro/features/templates/data/datasources/dosage_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/presentation/widgets/custom_elevated_button.dart';
import 'package:babosthapotro/features/home/domain/entities/medicine.dart';
import 'package:babosthapotro/features/home/data/repositories/home_repository.dart';
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

  final _dosageFocus = FocusNode();
  final _takingTimeFocus = FocusNode();
  final _durationFocus = FocusNode();
  final _routeFocus = FocusNode();
  final _instructionFocus = FocusNode();
  final _volumeFocus = FocusNode();

  // Source of truth for suggestions (unfiltered)
  List<String> _sourceDosages = [];
  List<String> _sourceTakingTimes = [];
  List<String> _sourceRoutes = [];
  List<String> _sourceInstructions = [];
  List<String> _sourceDurations = [];

  // Displayed suggestions (filtered)

  List<String> _suggestedRoutes = [];
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
    _routeController.addListener(_filterRoutes);
    _durationController.addListener(_filterDurations);

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
    _routeController.removeListener(_filterRoutes);
    _durationController.removeListener(_filterDurations);
    _dosageController.dispose();
    _takingTimeController.dispose();
    _durationController.dispose();
    _routeController.dispose();
    _instructionController.dispose();
    _volumeController.dispose();
    _dosageFocus.dispose();
    _takingTimeFocus.dispose();
    _durationFocus.dispose();
    _routeFocus.dispose();
    _instructionFocus.dispose();
    _volumeFocus.dispose();
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
      // 0. Selected item always creates a "match" context conceptually, but sorting logic puts matches first.

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

    // Filter out non-matches if query is present?
    // The previous logic for routes used _sortSuggestions just for sorting.
    // But for 'smart search' imply filtering too?
    // User said: "If user inout 1 it will show 1 days...". Suggests filtering out non-matches.
    // But `_sortSuggestions` returns everything sorted.
    // Let's modify usage in the filter method to take top matches or filter.

    // For now, let's keep _sortSuggestions as returning a sorted list.
    // It's better to filter in the view or have _sortSuggestions optionally filter 0 scores.
    // Actually, `_sortSuggestions` currently just sorts. 0 score items end up at bottom.
    // If I want to HIDE non-matches, I should do `where` check.

    return items.map((e) => e.value).toList();
  }

  void _filterRoutes() {
    final allRelevant = {..._sourceRoutes, ..._allRoutes}.toList();
    setState(() {
      _suggestedRoutes = _sortSuggestions(allRelevant, _routeController.text);
    });
  }

  void _filterDurations() {
    setState(() {
      // If exact match found in source list, show full list (context restoration)
      if (_sourceDurations.contains(_durationController.text)) {
        _suggestedDurations = _sourceDurations;
        return;
      }

      final sorted = _sortSuggestions(
        _sourceDurations,
        _durationController.text,
      );
      // If we have text, we probably want to only show matches?
      if (_durationController.text.isNotEmpty) {
        // We can filter manually here or trust the sort?
        // The user said "it will show". Usually implies hiding others.
        // Let's filter out things with 0 match score if we want true "search".
        // Re-using specific logic here.
        final qLower = _durationController.text.toLowerCase();
        final qDigitsOnly = qLower.replaceAll(RegExp(r'[^0-9০-৯]'), '');
        final qBangla = _toBangla(qLower);
        final qBanglaDigitsOnly = qDigitsOnly.isNotEmpty
            ? _toBangla(qDigitsOnly)
            : '';

        _suggestedDurations = sorted.where((s) {
          return _matchScore(
                s,
                qLower,
                qBangla,
                qDigitsOnly,
                qBanglaDigitsOnly,
              ) >
              0;
        }).toList();
      } else {
        _suggestedDurations = sorted;
      }
    });
  }

  void _updateSuggestions(Medicine medicine, {bool clearValues = false}) {
    final suggestions = getDosageSuggestions(
      dosageForm: medicine.dosageForm,
      genericName: medicine.genericName,
      lang: 'bn',
    );

    final durations = getDurationSuggestions('bn');

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

      _suggestedRoutes = _sourceRoutes;
      _suggestedDurations = _sourceDurations; // Initialize

      if (_sourceRoutes.isNotEmpty) {
        if (_sourceRoutes.length == 1) {
          _routeController.text = _sourceRoutes.first;
        }
      } else {
        if (_routeController.text.isEmpty &&
            isOralDosageForm(medicine.dosageForm)) {
          _routeController.text = 'Oral';
        }
      }

      // Trigger filters

      _filterRoutes();
      _filterDurations();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;

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
                                hintText: 'Search Medicine',
                                validator: (v) => _selectedMedicine == null
                                    ? 'Please select a medicine'
                                    : null,
                              );
                            },
                      ),
                    const Gap(12),

                    // Dosage
                    Builder(
                      builder: (context) {
                        final dosageForm = _selectedMedicine?.dosageForm;
                        final bIsInfusion = isInfusion(dosageForm);
                        final bIsOral = isOralDosageForm(dosageForm);
                        final bIsSuppository = isSuppository(dosageForm);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (bIsInfusion) ...[
                              CustomTextFormField(
                                controller: _volumeController,
                                focusNode: _volumeFocus,
                                hintText: 'Volume (e.g. 1L)',
                                textInputAction: TextInputAction.next,
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
                                      final isSelected =
                                          _volumeController.text == vol;
                                      return ActionChip(
                                        label: Text(
                                          vol,
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : null,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (isSelected) {
                                            _volumeController.clear();
                                          } else {
                                            _volumeController.text = vol;
                                            _dosageFocus.requestFocus();
                                          }

                                          _volumeController.selection =
                                              TextSelection.fromPosition(
                                                TextPosition(
                                                  offset: _volumeController
                                                      .text
                                                      .length,
                                                ),
                                              );
                                          setState(() {});
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
                              const Gap(12),
                            ],

                            Autocomplete<String>(
                              key: ValueKey(_selectedMedicine),
                              initialValue: TextEditingValue(
                                text: _dosageController.text,
                              ),
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                final query = textEditingValue.text;
                                final queryBangla = _toBangla(query);
                                final queryDigitsOnly = query.replaceAll(
                                  RegExp(r'[^0-9০-৯]'),
                                  '',
                                );

                                // Create scores for sorting
                                int matchScore(String source) {
                                  final sLower = source.toLowerCase();

                                  // 1. Exact match (Highest Priority)
                                  if (sLower == query ||
                                      sLower == queryBangla) {
                                    return 3;
                                  }

                                  // 2. Smart Digit Exact match
                                  if (queryDigitsOnly.isNotEmpty) {
                                    final sourceDigitsOnly = source.replaceAll(
                                      RegExp(r'[^0-9০-৯]'),
                                      '',
                                    );
                                    final sourceNorm = _toBangla(
                                      sourceDigitsOnly,
                                    );
                                    final queryNorm = _toBangla(
                                      queryDigitsOnly,
                                    );

                                    // 2a. Exact Digit Match
                                    if (sourceNorm == queryNorm) {
                                      return 3; // Treat as exact match
                                    }

                                    // 2b. Partial Digit Match (Prefix only)
                                    if (sourceNorm.startsWith(queryNorm)) {
                                      return 2; // Treat as partial match
                                    }
                                  }

                                  // 3. Contains match
                                  if (sLower.contains(query) ||
                                      sLower.contains(queryBangla)) {
                                    return 2;
                                  }

                                  return 0;
                                }

                                final matches = _sourceDosages.where((option) {
                                  if (bIsInfusion) {
                                    return true; // Show all if infusion? Or follow strict logic? existing logic implies strict true for dosages.
                                  }
                                  // Reusing the strict logic from _sortSuggestions indirectly by just filtering here?
                                  // Wait, simpler: Reuse the logic from `_filterDosages` but return list.
                                  // Actually _filterDosages sets state. I should inline the logic or extract it.
                                  // Let's inline a simplified version or the robust version.

                                  // For dosages we want Strict matching usually?
                                  // Existing code called _sortSuggestions(..., strict: true).
                                  // So we filter out non-matches.
                                  return matchScore(option) > 0;
                                }).toList();

                                // Sort
                                matches.sort((a, b) {
                                  final scoreA = matchScore(a);
                                  final scoreB = matchScore(b);
                                  if (scoreA != scoreB) {
                                    return scoreB.compareTo(scoreA);
                                  }
                                  return a.compareTo(
                                    b,
                                  ); // Alphabetical tie-breaker
                                });

                                return matches;
                              },
                              onSelected: (String selection) {
                                _dosageController.text = selection;
                                // Move to next focus
                                if (bIsOral) {
                                  _takingTimeFocus.requestFocus();
                                } else {
                                  _durationFocus.requestFocus();
                                }
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
                                      focusNode:
                                          focusNode, // Autocomplete provides this, but we can manage requestFocus manually
                                      textInputAction: TextInputAction.next,
                                      hintText: bIsInfusion
                                          ? 'Route + Dosage'
                                          : 'Dosage (e.g. 1+0+1)',
                                      validator: (v) =>
                                          v!.isEmpty ? 'Required' : null,
                                      onChanged: (val) {
                                        // Sync with master controller
                                        _dosageController.text = val;
                                      },
                                    );
                                  },
                              optionsViewBuilder:
                                  (context, onSelected, options) {
                                    return Align(
                                      alignment: Alignment.topLeft,
                                      child: Material(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        color: colors.card,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                            maxHeight: 200,
                                            maxWidth:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width -
                                                32,
                                          ),
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemCount: options.length,
                                            separatorBuilder: (_, _) => Divider(
                                              height: 1,
                                              color: colors.border,
                                            ),
                                            itemBuilder: (context, index) {
                                              final option = options.elementAt(
                                                index,
                                              );
                                              return InkWell(
                                                onTap: () => onSelected(option),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    12,
                                                  ),
                                                  child: Text(
                                                    option,
                                                    style: context
                                                        .textStyle
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                            ),

                            if (bIsOral) ...[
                              const Gap(12),
                              CustomTextFormField(
                                controller: _takingTimeController,
                                focusNode: _takingTimeFocus,
                                textInputAction: TextInputAction.next,
                                hintText: 'Taking time (e.g. After meal)',
                              ),
                              if (_sourceTakingTimes.isNotEmpty) ...[
                                const Gap(8),
                                SizedBox(
                                  height: 40,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _sourceTakingTimes.length,
                                    separatorBuilder: (_, _) => const Gap(8),
                                    itemBuilder: (context, index) {
                                      final time = _sourceTakingTimes[index];
                                      final isSelected =
                                          _takingTimeController.text == time;
                                      return ActionChip(
                                        label: Text(
                                          time,
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : null,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (isSelected) {
                                            _takingTimeController.clear();
                                          } else {
                                            _takingTimeController.text = time;
                                            _durationFocus.requestFocus();
                                          }

                                          _takingTimeController.selection =
                                              TextSelection.fromPosition(
                                                TextPosition(
                                                  offset: _takingTimeController
                                                      .text
                                                      .length,
                                                ),
                                              );
                                          setState(() {});
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
                            ],

                            const Gap(12),
                            CustomTextFormField(
                              controller: _durationController,
                              focusNode: _durationFocus,
                              hintText: 'Duration (e.g. 7 days)',
                              textInputAction: TextInputAction.next,
                            ),
                            if (_suggestedDurations.isNotEmpty) ...[
                              const Gap(8),
                              SizedBox(
                                height: 40,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _suggestedDurations.length,
                                  separatorBuilder: (_, _) => const Gap(8),
                                  itemBuilder: (context, index) {
                                    final duration = _suggestedDurations[index];
                                    final isSelected =
                                        _durationController.text == duration;
                                    return ActionChip(
                                      label: Text(
                                        duration,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : null,
                                        ),
                                      ),
                                      onPressed: () {
                                        if (isSelected) {
                                          _durationController.clear();
                                        } else {
                                          _durationController.text = duration;
                                          if (bIsSuppository) {
                                            _routeFocus.requestFocus();
                                          } else {
                                            _instructionFocus.requestFocus();
                                          }
                                        }

                                        _durationController.selection =
                                            TextSelection.fromPosition(
                                              TextPosition(
                                                offset: _durationController
                                                    .text
                                                    .length,
                                              ),
                                            );
                                        setState(() {});
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

                            if (bIsSuppository) ...[
                              const Gap(12),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      controller: _routeController,
                                      focusNode: _routeFocus,
                                      textInputAction: TextInputAction.next,
                                      hintText: 'Route',
                                    ),
                                  ),
                                  if (_suggestedRoutes.isNotEmpty) ...[
                                    const Gap(8),
                                    PopupMenuButton<String>(
                                      icon: const Icon(
                                        Icons.arrow_drop_down_circle_outlined,
                                      ),
                                      onSelected: (String value) {
                                        _routeController.text = value;
                                        _routeController.selection =
                                            TextSelection.fromPosition(
                                              TextPosition(
                                                offset: _routeController
                                                    .text
                                                    .length,
                                              ),
                                            );
                                        _instructionFocus.requestFocus();
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return _suggestedRoutes.map((
                                          String choice,
                                        ) {
                                          final isSelected =
                                              _routeController.text == choice;
                                          return PopupMenuItem<String>(
                                            value: choice,
                                            child: Text(
                                              choice,
                                              style: TextStyle(
                                                color: isSelected
                                                    ? colors.primary
                                                    : null,
                                                fontWeight: isSelected
                                                    ? FontWeight.bold
                                                    : null,
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
                          ],
                        );
                      },
                    ),

                    const Gap(12),

                    CustomTextFormField(
                      controller: _instructionController,
                      focusNode: _instructionFocus,
                      textInputAction: TextInputAction.done,
                      hintText: 'Instruction (Optional)',
                    ),
                    if (_sourceInstructions.isNotEmpty) ...[
                      const Gap(8),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _sourceInstructions.length,
                          separatorBuilder: (_, _) => const Gap(8),
                          itemBuilder: (context, index) {
                            final note = _sourceInstructions[index];
                            final isSelected =
                                _instructionController.text == note;
                            return ActionChip(
                              label: Text(
                                note,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : null,
                                ),
                              ),
                              onPressed: () {
                                if (isSelected) {
                                  _instructionController.clear();
                                } else {
                                  _instructionController.text = note;
                                  // No Next field, maybe close keyboard or do nothing?
                                  // usually last field just keeps focus or unfocuses.
                                }

                                _instructionController
                                    .selection = TextSelection.fromPosition(
                                  TextPosition(
                                    offset: _instructionController.text.length,
                                  ),
                                );
                                setState(() {});
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
                  ],
                ),
              ),
            ),
          ),
          const Gap(16),
          CustomElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  _selectedMedicine != null) {
                Navigator.pop(
                  context,
                  UiMedicine(
                    medicine: _selectedMedicine!,
                    volume: _volumeController.text.isNotEmpty
                        ? _volumeController.text
                        : null,
                    dosage: _dosageController.text,
                    takingTime: _takingTimeController.text,
                    duration: _durationController.text,
                    route: _routeController.text.isEmpty
                        ? 'Oral'
                        : _routeController.text,
                    instruction: _instructionController.text,
                  ),
                );
              }
            },
            text: 'Add Medicine',
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
