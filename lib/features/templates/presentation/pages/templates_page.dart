import 'package:babosthapotro/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/features/home/presentation/providers/home_provider.dart';
import 'package:babosthapotro/features/home/presentation/widgets/sponsored_card.dart';
import 'package:babosthapotro/features/home/data/models/create_template_request.dart';
import 'package:babosthapotro/features/home/data/models/medicine.dart';
import 'package:babosthapotro/features/home/data/models/investigation.dart';
import 'package:babosthapotro/features/home/data/repositories/home_repository.dart';
import 'package:babosthapotro/features/templates/data/dosage_data.dart';

class TemplatesPage extends ConsumerStatefulWidget {
  const TemplatesPage({super.key});

  @override
  ConsumerState<TemplatesPage> createState() => _TemplatesPageState();
}

class _TemplatesPageState extends ConsumerState<TemplatesPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _adviceController = TextEditingController();
  final _followUpController = TextEditingController();

  final List<_UiMedicine> _medicines = [];
  final List<Investigation> _investigations = [];

  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _adviceController.dispose();
    _followUpController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_medicines.isEmpty && _investigations.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add at least one medicine or investigation'),
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final request = CreateTemplateRequest(
        name: _nameController.text,
        medicines: _medicines
            .map(
              (m) => CreateTemplateMedicine(
                medicineId: m.medicine.id,
                dosage: m.dosage,
                takingTime: m.takingTime,
                duration: m.duration,
                route: m.route,
                instruction: m.instruction,
              ),
            )
            .toList(),
        investigations: _investigations.map((i) => i.id).toList(),
        advice: _adviceController.text,
        nextFollowUp: _followUpController.text.isEmpty
            ? null
            : _followUpController.text,
      );

      await ref.read(homeRepositoryProvider).createTemplate(request);

      if (mounted) {
        context.pop();
        // optionally refresh templates list
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error creating template: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _addOrEditMedicine({
    _UiMedicine? existingMedicine,
    int? index,
  }) async {
    final result = await showModalBottomSheet<_UiMedicine>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) =>
          _AddMedicineBottomSheet(initialMedicine: existingMedicine),
    );

    if (result != null) {
      if (index != null) {
        setState(() {
          _medicines[index] = result;
        });
      } else {
        setState(() {
          _medicines.add(result);
        });
      }
    }
  }

  void _addInvestigation() async {
    final result = await showModalBottomSheet<Investigation>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => const _AddInvestigationBottomSheet(),
    );
    if (result != null) {
      setState(() {
        _investigations.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;
    final styles = context.textStyle;
    final sponsoredState = ref.watch(sponsoredProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Template')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sponsoredState.when(
                data: (sponsored) => Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: SponsoredCard(sponsored: sponsored),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),

              Text('Template Name', style: styles.labelLarge),
              const Gap(8),
              CustomTextFormField(
                controller: _nameController,
                hintText: 'e.g. Seasonal Flu',
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const Gap(24),

              // Investigations
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Investigations',
                    style: styles.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: _addInvestigation,
                    icon: const Icon(Icons.add),
                    label: const Text('Add'),
                  ),
                ],
              ),
              if (_investigations.isEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.card,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: colors.border),
                  ),
                  child: Center(
                    child: Text(
                      'No investigations added',
                      style: styles.bodyMedium.copyWith(
                        color: colors.mutedForeground,
                      ),
                    ),
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _investigations.length,
                  separatorBuilder: (_, _) => const Gap(8),
                  itemBuilder: (context, index) {
                    final item = _investigations[index];
                    return Card(
                      color: colors.card,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: colors.border),
                      ),
                      child: ListTile(
                        title: Text(item.name, style: styles.bodyLarge),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: colors.destructive),
                          onPressed: () =>
                              setState(() => _investigations.removeAt(index)),
                        ),
                      ),
                    );
                  },
                ),
              const Gap(24),
              // Medicines
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Medicines',
                    style: styles.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () => _addOrEditMedicine(),
                    icon: const Icon(Icons.add),
                    label: const Text('Add'),
                  ),
                ],
              ),
              if (_medicines.isEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.card,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: colors.border),
                  ),
                  child: Center(
                    child: Text(
                      'No medicines added',
                      style: styles.bodyMedium.copyWith(
                        color: colors.mutedForeground,
                      ),
                    ),
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _medicines.length,
                  separatorBuilder: (_, _) => const Gap(8),
                  itemBuilder: (context, index) {
                    final item = _medicines[index];
                    return Card(
                      color: colors.card,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: colors.border),
                      ),
                      child: ListTile(
                        title: Text(
                          '${item.medicine.dosageForm} ${item.medicine.brandName} ${item.medicine.strength}',
                          style: styles.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          [
                            if (item.volume != null) item.volume,
                            item.dosage,
                            if (item.takingTime.isNotEmpty) item.takingTime,
                            item.duration,
                            if (item.instruction.isNotEmpty) item.instruction,
                          ].join(' • '),
                          style: styles.bodySmall,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: colors.primary),
                              onPressed: () => _addOrEditMedicine(
                                existingMedicine: item,
                                index: index,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: colors.destructive,
                              ),
                              onPressed: () =>
                                  setState(() => _medicines.removeAt(index)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              const Gap(24),

              Text('Advice', style: styles.labelLarge),
              const Gap(8),
              CustomTextFormField(
                controller: _adviceController,
                hintText: 'Enter advice for the patient...',
                maxLines: 3,
              ),
              const Gap(16),

              Text('Next Follow Up', style: styles.labelLarge),
              const Gap(8),
              CustomTextFormField(
                controller: _followUpController,
                hintText: 'e.g. 7 days',
              ),
              const Gap(32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // Typo will fix
                  onPressed: _isSubmitting ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    foregroundColor: colors.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Save Template'),
                ),
              ),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}

class _UiMedicine {
  final Medicine medicine;
  final String? volume;
  final String dosage;
  final String takingTime;
  final String duration;
  final String route;
  final String instruction;

  _UiMedicine({
    required this.medicine,
    this.volume,
    required this.dosage,
    required this.takingTime,
    required this.duration,
    required this.route,
    required this.instruction,
  });
}

class _AddMedicineBottomSheet extends ConsumerStatefulWidget {
  final _UiMedicine? initialMedicine;

  const _AddMedicineBottomSheet({this.initialMedicine});

  @override
  ConsumerState<_AddMedicineBottomSheet> createState() =>
      _AddMedicineBottomSheetState();
}

class _AddMedicineBottomSheetState
    extends ConsumerState<_AddMedicineBottomSheet> {
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
            isOralDosageForm(medicine.dosageForm)) {
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
                                hintText: 'Volume (e.g. 1L)',
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
                                          _volumeController.text = vol;
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
                                            separatorBuilder: (_, _) =>
                                                Divider(
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
                                hintText: 'Taking time (e.g. After meal)',
                              ),
                              if (_suggestedTakingTimes.isNotEmpty) ...[
                                const Gap(8),
                                SizedBox(
                                  height: 40,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _suggestedTakingTimes.length,
                                    separatorBuilder: (_, _) => const Gap(8),
                                    itemBuilder: (context, index) {
                                      final time = _suggestedTakingTimes[index];
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
                                          _takingTimeController.text = time;
                                          _takingTimeController.selection =
                                              TextSelection.fromPosition(
                                                TextPosition(
                                                  offset: _takingTimeController
                                                      .text
                                                      .length,
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
                            ],

                            const Gap(12),
                            CustomTextFormField(
                              controller: _durationController,
                              hintText: 'Duration (e.g. 7 days)',
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
                                        _durationController.text = duration;
                                        _durationController.selection =
                                            TextSelection.fromPosition(
                                              TextPosition(
                                                offset: _durationController
                                                    .text
                                                    .length,
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

                            if (bIsSuppository) ...[
                              const Gap(12),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFormField(
                                      controller: _routeController,
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
                      hintText: 'Instruction (Optional)',
                    ),
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
                                        _instructionController.text.replaceAll(
                                          ', $note',
                                          '',
                                        );
                                  } else if (_instructionController.text
                                      .contains('$note, ')) {
                                    _instructionController.text =
                                        _instructionController.text.replaceAll(
                                          '$note, ',
                                          '',
                                        );
                                  } else {
                                    _instructionController.text =
                                        _instructionController.text.replaceAll(
                                          note,
                                          '',
                                        );
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
                                    offset: _instructionController.text.length,
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
                  _UiMedicine(
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

class _AddInvestigationBottomSheet extends ConsumerStatefulWidget {
  const _AddInvestigationBottomSheet();

  @override
  ConsumerState<_AddInvestigationBottomSheet> createState() =>
      _AddInvestigationBottomSheetState();
}

class _AddInvestigationBottomSheetState
    extends ConsumerState<_AddInvestigationBottomSheet> {
  Investigation? _selectedInvestigation;

  @override
  Widget build(BuildContext context) {
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
                'Add Investigation',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const Gap(16),
          Expanded(
            child: Column(
              children: [
                Autocomplete<Investigation>(
                  displayStringForOption: (Investigation option) => option.name,
                  optionsBuilder: (TextEditingValue textEditingValue) async {
                    if (textEditingValue.text.length < 2) {
                      return const Iterable<Investigation>.empty();
                    }
                    final response = await ref
                        .read(homeRepositoryProvider)
                        .getInvestigations(search: textEditingValue.text);
                    return response;
                  },
                  onSelected: (Investigation selection) {
                    setState(() => _selectedInvestigation = selection);
                  },
                  fieldViewBuilder:
                      (context, controller, focusNode, onEditingComplete) {
                        return CustomTextFormField(
                          controller: controller,
                          focusNode: focusNode,
                          hintText: 'Search Investigation',
                        );
                      },
                ),
              ],
            ),
          ),
          const Gap(16),
          CustomElevatedButton(
            onPressed: () {
              if (_selectedInvestigation != null) {
                Navigator.pop(context, _selectedInvestigation);
              }
            },
            text: 'Add Investigation',
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
