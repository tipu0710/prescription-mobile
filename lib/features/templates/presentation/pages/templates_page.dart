import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/features/home/presentation/providers/home_provider.dart';
import 'package:babosthapotro/features/home/presentation/widgets/sponsored_card.dart';
import 'package:babosthapotro/features/home/domain/entities/create_template_request.dart';
import 'package:babosthapotro/features/home/domain/entities/investigation.dart';
import 'package:babosthapotro/features/home/data/repositories/home_repository.dart';
import '../models/ui_medicine.dart';
import '../widgets/add_medicine_bottom_sheet.dart';
import '../widgets/add_investigation_bottom_sheet.dart';

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

  final List<UiMedicine> _medicines = [];
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
    UiMedicine? existingMedicine,
    int? index,
  }) async {
    final result = await showModalBottomSheet<UiMedicine>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) =>
          AddMedicineBottomSheet(initialMedicine: existingMedicine),
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
      builder: (context) => const AddInvestigationBottomSheet(),
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
