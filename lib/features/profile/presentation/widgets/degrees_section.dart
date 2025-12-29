import 'package:babosthapotro/core/utils/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../theme/theme_extensions.dart';
import '../../data/models/degree.dart';
import '../providers/degrees_provider.dart';

class DegreesSection extends ConsumerWidget {
  const DegreesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final degreesAsync = ref.watch(degreesProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDegreeBottomSheet(context, null);
        },
        backgroundColor: context.appColor.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: degreesAsync.when(
        data: (degrees) {
          if (degrees.isEmpty) {
            return Center(
              child: Text(
                "No degrees added yet.",
                style: context.textStyle.bodyMedium.copyWith(
                  color: context.appColor.mutedForeground,
                ),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: degrees.length,
            separatorBuilder: (c, i) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final degree = degrees[index];
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: context.appColor.border),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: context.appColor.primary.withValues(
                            alpha: 0.1,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.school_outlined,
                          color: context.appColor.primary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              degree.degreeName,
                              style: context.textStyle.titleMedium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              degree.institution,
                              style: context.textStyle.bodyMedium.copyWith(
                                color: context.appColor.mutedForeground,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              degree.fieldOfStudy,
                              style: context.textStyle.bodySmall.copyWith(
                                color: context.appColor.mutedForeground,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit_outlined,
                              size: 20,
                              color: context.appColor.mutedForeground,
                            ),
                            onPressed: () {
                              _showDegreeBottomSheet(context, degree);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              size: 20,
                              color: context.appColor.destructive,
                            ),
                            onPressed: () =>
                                _confirmDelete(context, ref, degree),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }

  void _showDegreeBottomSheet(BuildContext context, Degree? degree) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.appColor.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _DegreeBottomSheet(degree: degree),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, Degree degree) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Degree"),
        content: const Text("Are you sure you want to delete this degree?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(degreesProvider.notifier).deleteDegree(degree.id);
            },
            child: Text(
              "Delete",
              style: TextStyle(color: context.appColor.destructive),
            ),
          ),
        ],
      ),
    );
  }
}

class _DegreeBottomSheet extends ConsumerStatefulWidget {
  final Degree? degree;

  const _DegreeBottomSheet({this.degree});

  @override
  ConsumerState<_DegreeBottomSheet> createState() => _DegreeBottomSheetState();
}

class _DegreeBottomSheetState extends ConsumerState<_DegreeBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  late TextEditingController _degreeNameController;
  late TextEditingController _degreeNameLocalController;
  late TextEditingController _fieldController;
  late TextEditingController _fieldLocalController;
  late TextEditingController _institutionController;
  late TextEditingController _institutionLocalController;

  @override
  void initState() {
    super.initState();
    final d = widget.degree;
    _degreeNameController = TextEditingController(text: d?.degreeName ?? '');
    _degreeNameLocalController = TextEditingController(
      text: d?.degreeNameLocal ?? '',
    );
    _fieldController = TextEditingController(text: d?.fieldOfStudy ?? '');
    _fieldLocalController = TextEditingController(
      text: d?.fieldOfStudyLocal ?? '',
    );
    _institutionController = TextEditingController(text: d?.institution ?? '');
    _institutionLocalController = TextEditingController(
      text: d?.institutionLocal ?? '',
    );
  }

  @override
  void dispose() {
    _degreeNameController.dispose();
    _degreeNameLocalController.dispose();
    _fieldController.dispose();
    _fieldLocalController.dispose();
    _institutionController.dispose();
    _institutionLocalController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(degreesProvider.notifier);
      final newDegree = Degree(
        id: widget.degree?.id ?? 0,
        degreeName: _degreeNameController.text,
        degreeNameLocal: _degreeNameLocalController.text,
        fieldOfStudy: _fieldController.text,
        fieldOfStudyLocal: _fieldLocalController.text,
        institution: _institutionController.text,
        institutionLocal: _institutionLocalController.text,
      );

      try {
        if (widget.degree != null) {
          await notifier.editDegree(newDegree);
        } else {
          await notifier.addDegree(newDegree);
        }
        if (mounted) {
          Navigator.pop(context);
        }

        // Show success if needed (using scaffold messenger which is nearest)
        if (mounted) {
          ToastService.showSuccess(
            context,
            message: widget.degree != null ? "Degree Updated" : "Degree Added",
          );
        }
      } catch (e) {
        if (mounted) {
          ToastService.showError(
            context,
            message: "Failed to save: $e",
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.degree != null;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle Bar
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: context.appColor.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEditing ? "Edit Degree" : "Add New Degree",
                      style: context.textStyle.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                _buildLabel("Degree Name"),
                TextFormField(
                  controller: _degreeNameController,
                  validator: (v) =>
                      v?.trim().isEmpty ?? true ? "Required" : null,
                  decoration: InputDecoration(
                    hintText: "e.g. MBBS",
                    hintStyle: TextStyle(
                      color: context.appColor.mutedForeground.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                _buildLabel("Degree Name (Local)"),
                TextFormField(
                  controller: _degreeNameLocalController,
                  decoration: InputDecoration(
                    hintText: "e.g. এমবিবিএস",
                    hintStyle: TextStyle(
                      color: context.appColor.mutedForeground.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                _buildLabel("Field of Study"),
                TextFormField(
                  controller: _fieldController,
                  decoration: InputDecoration(
                    hintText: "e.g. Medicine",
                    hintStyle: TextStyle(
                      color: context.appColor.mutedForeground.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                _buildLabel("Field of Study (Local)"),
                TextFormField(
                  controller: _fieldLocalController,
                  decoration: InputDecoration(
                    hintText: "e.g. মেডিসিন",
                    hintStyle: TextStyle(
                      color: context.appColor.mutedForeground.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                _buildLabel("Institution"),
                TextFormField(
                  controller: _institutionController,
                  validator: (v) =>
                      v?.trim().isEmpty ?? true ? "Required" : null,
                  decoration: InputDecoration(
                    hintText: "e.g. Dhaka Medical College",
                    hintStyle: TextStyle(
                      color: context.appColor.mutedForeground.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                _buildLabel("Institution (Local)"),
                TextFormField(
                  controller: _institutionLocalController,
                  decoration: InputDecoration(
                    hintText: "e.g. ঢাকা মেডিকেল কলেজ",
                    hintStyle: TextStyle(
                      color: context.appColor.mutedForeground.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.appColor.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(isEditing ? "Save Changes" : "Save Degree"),
                  ),
                ),

                // Add extra padding at the bottom for safety
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: context.textStyle.bodySmall.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
