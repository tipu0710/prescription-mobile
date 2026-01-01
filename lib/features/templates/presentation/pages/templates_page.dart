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

  // Common routes
  final List<String> _routes = [
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
                    CustomTextFormField(
                      controller: _dosageController,
                      hintText: 'Dosage (e.g. 1+0+1)',
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    const Gap(12),
                    CustomTextFormField(
                      controller: _takingTimeController,
                      hintText: 'Taking Time (e.g. After meal)',
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    const Gap(12),
                    CustomTextFormField(
                      controller: _durationController,
                      hintText: 'Duration (e.g. 7 days)',
                      validator: (v) => v!.isEmpty ? 'Required' : null,
                    ),
                    const Gap(12),
                    DropdownButtonFormField<String>(
                      initialValue: 'Oral',
                      items: _routes
                          .map(
                            (r) => DropdownMenuItem(value: r, child: Text(r)),
                          )
                          .toList(),
                      onChanged: (v) => setState(() {
                        _routeController.text = v!;
                      }),
                      decoration: InputDecoration(
                        labelText: 'Route',
                        filled: true,
                        fillColor: colors.card,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: colors.border),
                        ),
                      ),
                    ),
                    const Gap(12),
                    CustomTextFormField(
                      controller: _instructionController,
                      hintText: 'Instruction (Optional)',
                    ),
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
