import 'package:babosthapotro/core/utils/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../theme/theme_extensions.dart';
import '../../data/models/chamber.dart';
import '../providers/chambers_provider.dart';
import 'package:babosthapotro/core/presentation/widgets/empty_state_widget.dart';

class ChambersSection extends ConsumerWidget {
  const ChambersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chambersAsync = ref.watch(chambersProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showChamberBottomSheet(context, null);
        },
        backgroundColor: context.appColor.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: chambersAsync.when(
        data: (chambers) {
          if (chambers.isEmpty) {
            return Center(
              child: EmptyStateWidget(
                icon: Icons.location_on_outlined,
                message: "No chambers added yet",
                subMessage: "Add your chamber details to get started.",
                actionLabel: "Add Chamber",
                onAction: () => _showChamberBottomSheet(context, null),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: chambers.length,
            separatorBuilder: (c, i) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final chamber = chambers[index];
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: context.appColor.border),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                              Icons.location_on_outlined,
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
                                  chamber.chamberName,
                                  style: context.textStyle.titleMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  chamber.address,
                                  style: context.textStyle.bodyMedium.copyWith(
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
                                  _showChamberBottomSheet(context, chamber);
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete_outline,
                                  size: 20,
                                  color: context.appColor.destructive,
                                ),
                                onPressed: () =>
                                    _confirmDelete(context, ref, chamber),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (chamber.visitingHours.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Divider(color: context.appColor.border),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: chamber.visitingHours.map((vh) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: context.appColor.secondary,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 14,
                                    color: context.appColor.mutedForeground,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "${vh.day}: ${vh.timeSlots.map((ts) => "${ts.start}-${ts.end}").join(", ")}",
                                    style: context.textStyle.bodySmall,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
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

  void _showChamberBottomSheet(BuildContext context, Chamber? chamber) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.appColor.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _ChamberBottomSheet(chamber: chamber),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, Chamber chamber) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Chamber"),
        content: const Text("Are you sure you want to delete this chamber?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(chambersProvider.notifier).deleteChamber(chamber.id);
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

class _ChamberBottomSheet extends ConsumerStatefulWidget {
  final Chamber? chamber;

  const _ChamberBottomSheet({this.chamber});

  @override
  ConsumerState<_ChamberBottomSheet> createState() =>
      _ChamberBottomSheetState();
}

class _ChamberBottomSheetState extends ConsumerState<_ChamberBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  bool _isActive = true;

  List<VisitingHour> _visitingHours = [];

  static const _days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  @override
  void initState() {
    super.initState();
    final c = widget.chamber;
    _nameController = TextEditingController(text: c?.chamberName ?? '');
    _addressController = TextEditingController(text: c?.address ?? '');
    _phoneController = TextEditingController(text: c?.contact.phone ?? '');
    _emailController = TextEditingController(text: c?.contact.email ?? '');
    _isActive = c?.isActive ?? true;
    _visitingHours = List.from(c?.visitingHours ?? []);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _addVisitingHour() {
    // Find first available day
    final selectedDays = _visitingHours.map((vh) => vh.day).toList();
    final availableDay = _days.firstWhere(
      (day) => !selectedDays.contains(day),
      orElse: () => _days.first,
    );

    setState(() {
      _visitingHours.add(
        VisitingHour(
          day: availableDay,
          timeSlots: [const TimeSlot(start: "09:00", end: "17:00")],
        ),
      );
    });
  }

  void _removeVisitingHour(int index) {
    setState(() {
      _visitingHours.removeAt(index);
    });
  }

  void _updateVisitingHourDay(int index, String? newDay) {
    if (newDay == null) return;
    setState(() {
      _visitingHours[index] = _visitingHours[index].copyWith(day: newDay);
    });
  }

  void _updateTimeSlot(int index, String start, String end) {
    setState(() {
      _visitingHours[index] = _visitingHours[index].copyWith(
        timeSlots: [TimeSlot(start: start, end: end)],
      );
    });
  }

  Future<void> _selectTime(
    BuildContext context,
    String initialTime,
    Function(String) onTimeSelected,
  ) async {
    final parts = initialTime.split(":");
    final initial = TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );

    final picked = await showTimePicker(context: context, initialTime: initial);

    if (picked != null) {
      final hour = picked.hour.toString().padLeft(2, '0');
      final minute = picked.minute.toString().padLeft(2, '0');
      onTimeSelected("$hour:$minute");
    }
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(chambersProvider.notifier);
      final newChamber = Chamber(
        id: widget.chamber?.id ?? 0,
        chamberName: _nameController.text,
        address: _addressController.text,
        contact: Contact(
          phone: _phoneController.text,
          email: _emailController.text,
        ),
        visitingHours: _visitingHours,
        isActive: _isActive,
      );

      try {
        if (widget.chamber != null) {
          await notifier.editChamber(newChamber);
        } else {
          await notifier.addChamber(newChamber);
        }
        if (mounted) {
          Navigator.pop(context);
          ToastService.showSuccess(
            context,
            message: widget.chamber != null
                ? "Chamber Updated"
                : "Chamber Added",
          );
        }
      } catch (e) {
        if (mounted) {
          ToastService.showError(context, message: "Failed to save: $e");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.chamber != null;

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
                      isEditing ? "Edit Chamber" : "Add New Chamber",
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

                _buildLabel("Chamber Name"),
                TextFormField(
                  controller: _nameController,
                  validator: (v) =>
                      v?.trim().isEmpty ?? true ? "Required" : null,
                  decoration: InputDecoration(
                    hintText: "e.g. City Care Clinic",
                    hintStyle: TextStyle(
                      color: context.appColor.mutedForeground.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                _buildLabel("Address"),
                TextFormField(
                  controller: _addressController,
                  validator: (v) =>
                      v?.trim().isEmpty ?? true ? "Required" : null,
                  decoration: InputDecoration(
                    hintText: "e.g. 123 Main St, Dhaka",
                    hintStyle: TextStyle(
                      color: context.appColor.mutedForeground.withValues(
                        alpha: 0.6,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel("Phone"),
                          TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              hintText: "+880...",
                              hintStyle: TextStyle(
                                color: context.appColor.mutedForeground
                                    .withValues(alpha: 0.6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel("Email"),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: "clinic@ex.com",
                              hintStyle: TextStyle(
                                color: context.appColor.mutedForeground
                                    .withValues(alpha: 0.6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Checkbox(
                      value: _isActive,
                      activeColor: context.appColor.primary,
                      onChanged: (v) => setState(() => _isActive = v ?? true),
                    ),
                    Text("Active Chamber", style: context.textStyle.bodyMedium),
                  ],
                ),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Visiting Hours",
                      style: context.textStyle.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: _addVisitingHour,
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text("Add Slot"),
                      style: TextButton.styleFrom(
                        foregroundColor: context.appColor.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                if (_visitingHours.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "No visiting hours added.",
                      style: context.textStyle.bodySmall.copyWith(
                        color: context.appColor.mutedForeground,
                      ),
                    ),
                  ),

                ..._visitingHours.asMap().entries.map((entry) {
                  final index = entry.key;
                  final vh = entry.value;
                  final ts = vh.timeSlots.first;

                  // Filter days that are selected in other rows
                  final selectedInOtherRows = _visitingHours
                      .asMap()
                      .entries
                      .where((e) => e.key != index)
                      .map((e) => e.value.day)
                      .toList();

                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: context.appColor.border),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: vh.day,
                                  isExpanded: true,
                                  items: _days.map((day) {
                                    final disabled = selectedInOtherRows
                                        .contains(day);
                                    return DropdownMenuItem(
                                      value: day,
                                      enabled: !disabled,
                                      child: Text(
                                        day,
                                        style: TextStyle(
                                          color: disabled
                                              ? context.appColor.mutedForeground
                                              : context.appColor.foreground,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (v) =>
                                      _updateVisitingHourDay(index, v),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                color: context.appColor.destructive,
                                size: 20,
                              ),
                              onPressed: () => _removeVisitingHour(index),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => _selectTime(
                                  context,
                                  ts.start,
                                  (t) => _updateTimeSlot(index, t, ts.end),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.appColor.border,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    ts.start,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text("to"),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () => _selectTime(
                                  context,
                                  ts.end,
                                  (t) => _updateTimeSlot(index, ts.start, t),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.appColor.border,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    ts.end,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),

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
                    child: Text(isEditing ? "Save Changes" : "Save Chamber"),
                  ),
                ),
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
