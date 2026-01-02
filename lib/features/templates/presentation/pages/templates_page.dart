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

  void _addMedicine() async {
    final result = await showModalBottomSheet<_UiMedicine>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => const _AddMedicineBottomSheet(),
    );
    if (result != null) {
      setState(() {
        _medicines.add(result);
      });
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
                    onPressed: _addMedicine,
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
                          item.medicine.brandName,
                          style: styles.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${item.dosage} • ${item.takingTime} • ${item.duration}\n${item.instruction}',
                          style: styles.bodySmall,
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: colors.destructive),
                          onPressed: () =>
                              setState(() => _medicines.removeAt(index)),
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
  final String dosage;
  final String takingTime;
  final String duration;
  final String route;
  final String instruction;

  _UiMedicine({
    required this.medicine,
    required this.dosage,
    required this.takingTime,
    required this.duration,
    required this.route,
    required this.instruction,
  });
}

class _AddMedicineBottomSheet extends ConsumerStatefulWidget {
  const _AddMedicineBottomSheet();

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

  // Source of truth for suggestions (unfiltered)
  List<String> _sourceDosages = [];
  List<String> _sourceTakingTimes = [];
  List<String> _sourceRoutes = [];
  List<String> _sourceInstructions = [];
  List<String> _sourceDurations = [];

  // Displayed suggestions (filtered)
  List<String> _suggestedDosages = [];
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
    _dosageController.addListener(_filterDosages);
    _takingTimeController.addListener(_filterTakingTimes);
    _durationController.addListener(_filterDurations);
    _routeController.addListener(_filterRoutes);
    _instructionController.addListener(_filterInstructions);
  }

  @override
  void dispose() {
    _dosageController.removeListener(_filterDosages);
    _takingTimeController.removeListener(_filterTakingTimes);
    _durationController.removeListener(_filterDurations);
    _routeController.removeListener(_filterRoutes);
    _instructionController.removeListener(_filterInstructions);
    _dosageController.dispose();
    _takingTimeController.dispose();
    _durationController.dispose();
    _routeController.dispose();
    _instructionController.dispose();
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
    if (sLower == query || sLower == queryBangla) return 3;

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
    if (sLower.contains(query) || sLower.contains(queryBangla)) return 2;

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

  void _filterDosages() {
    setState(() {
      _suggestedDosages = _sortSuggestions(
        _sourceDosages,
        _dosageController.text,
        strict: true,
      );
    });
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

  void _updateSuggestions(Medicine medicine) {
    final suggestions = getDosageSuggestions(
      dosageForm: medicine.dosageForm,
      genericName: medicine.genericName,
      lang: 'bn',
    );

    final durations = getDurationSuggestions('bn');

    setState(() {
      _sourceDosages = suggestions.dosages;
      _sourceTakingTimes = suggestions.takingTimes;
      _sourceRoutes = suggestions.routes;
      _sourceInstructions = suggestions.notes;
      _sourceDurations = durations;

      _suggestedDosages = _sourceDosages;
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
      _filterDosages();
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
                    Autocomplete<Medicine>(
                      displayStringForOption: (Medicine option) =>
                          '${option.brandName} (${option.strength})',
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
                      onSelected: (Medicine selection) {
                        setState(() => _selectedMedicine = selection);
                        _updateSuggestions(selection);
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
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
                    CustomTextFormField(
                      controller: _dosageController,
                      hintText: 'Dosage (e.g. 1+0+1)',
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    if (_suggestedDosages.isNotEmpty) ...[
                      const Gap(8),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _suggestedDosages.length,
                          separatorBuilder: (_, __) => const Gap(8),
                          itemBuilder: (context, index) {
                            final dosage = _suggestedDosages[index];
                            final isSelected = _dosageController.text == dosage;
                            return ActionChip(
                              label: Text(
                                dosage,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : null,
                                ),
                              ),
                              onPressed: () {
                                _dosageController.text = dosage;
                                _dosageController.selection =
                                    TextSelection.fromPosition(
                                      TextPosition(
                                        offset: _dosageController.text.length,
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

                    const Gap(12),

                    // Taking Time
                    CustomTextFormField(
                      controller: _takingTimeController,
                      hintText: 'Taking Time (e.g. After meal)',
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    if (_suggestedTakingTimes.isNotEmpty) ...[
                      const Gap(8),
                      // Using ListView for scrollable if many matches
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _suggestedTakingTimes.length,
                          separatorBuilder: (_, __) => const Gap(8),
                          itemBuilder: (context, index) {
                            final time = _suggestedTakingTimes[index];
                            final isSelected =
                                _takingTimeController.text == time;
                            return ActionChip(
                              label: Text(
                                time,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : null,
                                ),
                              ),
                              onPressed: () {
                                _takingTimeController.text = time;
                                _takingTimeController
                                    .selection = TextSelection.fromPosition(
                                  TextPosition(
                                    offset: _takingTimeController.text.length,
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

                    const Gap(12),
                    CustomTextFormField(
                      controller: _durationController,
                      hintText: 'Duration (e.g. 7 days)',
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    if (_suggestedDurations.isNotEmpty) ...[
                      const Gap(8),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _suggestedDurations.length,
                          separatorBuilder: (_, __) => const Gap(8),
                          itemBuilder: (context, index) {
                            final duration = _suggestedDurations[index];
                            final isSelected =
                                _durationController.text == duration;
                            return ActionChip(
                              label: Text(
                                duration,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : null,
                                ),
                              ),
                              onPressed: () {
                                _durationController.text = duration;
                                _durationController.selection =
                                    TextSelection.fromPosition(
                                      TextPosition(
                                        offset: _durationController.text.length,
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

                    const Gap(12),

                    // Route
                    CustomTextFormField(
                      controller: _routeController,
                      hintText: 'Route',
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                      suffixIcon: PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          _routeController.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          // Show all routes in dropdown for completeness
                          final allOptions = {
                            ..._sourceRoutes,
                            ..._allRoutes,
                          }.toList();
                          return allOptions.map((String value) {
                            return PopupMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    if (_suggestedRoutes.isNotEmpty) ...[
                      const Gap(8),
                      SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _suggestedRoutes.length,
                          separatorBuilder: (_, __) => const Gap(8),
                          itemBuilder: (context, index) {
                            final route = _suggestedRoutes[index];
                            final isSelected = _routeController.text == route;
                            return ActionChip(
                              label: Text(
                                route,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : null,
                                ),
                              ),
                              onPressed: () {
                                _routeController.text = route;
                                _routeController.selection =
                                    TextSelection.fromPosition(
                                      TextPosition(
                                        offset: _routeController.text.length,
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

                    const Gap(12),

                    // Instruction
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
                          separatorBuilder: (_, __) => const Gap(8),
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
                                  // Optional: remove if already selected?
                                  // Logic might be complex for removal from comma sep string.
                                  // For now, just append as before, but maybe clear if exact match?
                                  // Let's stick to simple append for now to avoid complexity in this step
                                  // or just re-add as done before.
                                  // Actually, standard behavior:
                                  if (_instructionController.text.isEmpty) {
                                    _instructionController.text = note;
                                  } else {
                                    _instructionController.text =
                                        '${_instructionController.text}, $note';
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
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  _selectedMedicine != null) {
                Navigator.pop(
                  context,
                  _UiMedicine(
                    medicine: _selectedMedicine!,
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
            child: const Text('Add Medicine'),
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
