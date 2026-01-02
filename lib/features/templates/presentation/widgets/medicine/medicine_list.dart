import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import '../../models/ui_medicine.dart';

class MedicineList extends StatelessWidget {
  final List<UiMedicine> medicines;
  final VoidCallback onAdd;
  final Function(UiMedicine, int) onEdit;
  final Function(int) onDelete;
  final Function(int, int) onReorder;

  const MedicineList({
    super.key,
    required this.medicines,
    required this.onAdd,
    required this.onEdit,
    required this.onDelete,
    required this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;
    final styles = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Medicines',
              style: styles.titleMedium.copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
          ],
        ),
        const Gap(8),
        if (medicines.isEmpty)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colors.card,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: colors.border),
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.medication_outlined,
                    size: 48,
                    color: colors.mutedForeground.withValues(alpha: 0.5),
                  ),
                  const Gap(8),
                  Text(
                    'No medicines added',
                    style: styles.bodyMedium.copyWith(
                      color: colors.mutedForeground,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: medicines.length,
            onReorder: onReorder,
            itemBuilder: (context, index) {
              final item = medicines[index];
              return Padding(
                key: ValueKey(item),
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.card,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colors.border),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: null, // Disable row tap
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Drag Handle
                            ReorderableDragStartListener(
                              index: index,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: colors.muted.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.drag_indicator,
                                  color: colors.mutedForeground,
                                  size: 20,
                                ),
                              ),
                            ),
                            const Gap(12),
                            // Content
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Brand & Generic Name
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${item.medicine.brandName} ${item.medicine.strength}',
                                              style: styles.titleSmall.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const Gap(2),
                                            Text(
                                              '${item.medicine.genericName} (${item.medicine.dosageForm})',
                                              style: styles.bodySmall.copyWith(
                                                color: colors.mutedForeground,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(12),

                                  // Dosage Chips
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 4,
                                    children: [
                                      if (item.dosage.isNotEmpty)
                                        _InfoBadge(
                                          text: item.dosage,
                                          icon: Icons.medication,
                                          color: colors.primary,
                                          bgColor: colors.primary.withValues(
                                            alpha: 0.1,
                                          ),
                                        ),
                                      if (item.volume != null &&
                                          item.volume!.isNotEmpty)
                                        _InfoBadge(
                                          text: item.volume!,
                                          icon: Icons.water_drop,
                                          color: Colors.teal,
                                          bgColor: Colors.teal.withValues(
                                            alpha: 0.1,
                                          ),
                                        ),
                                    ],
                                  ),
                                  const Gap(12),
                                  Divider(
                                    height: 1,
                                    color: colors.border.withValues(alpha: 0.5),
                                  ),
                                  const Gap(8),

                                  // Details (Time, Duration, Instruction)
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            if ([
                                              item.takingTime,
                                              item.duration,
                                            ].any((e) => e.isNotEmpty))
                                              _DetailRow(
                                                icon: Icons.schedule,
                                                text: [
                                                  if (item
                                                      .takingTime
                                                      .isNotEmpty)
                                                    item.takingTime,
                                                  if (item.duration.isNotEmpty)
                                                    item.duration,
                                                ].join(' • '),
                                                color: colors.foreground,
                                              ),
                                            if (item
                                                .instruction
                                                .isNotEmpty) ...[
                                              const Gap(4),
                                              _DetailRow(
                                                icon: Icons.assignment_outlined,
                                                text: item.instruction,
                                                color: colors.mutedForeground,
                                                isItalic: true,
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      // Actions
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () =>
                                                onEdit(item, index),
                                            icon: Icon(
                                              Icons.edit_outlined,
                                              size: 20,
                                              color: colors.mutedForeground,
                                            ),
                                            tooltip: 'Edit',
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            visualDensity:
                                                VisualDensity.compact,
                                          ),
                                          const Gap(16),
                                          IconButton(
                                            onPressed: () => onDelete(index),
                                            icon: Icon(
                                              Icons.delete_outline,
                                              size: 20,
                                              color: colors.destructive,
                                            ),
                                            tooltip: 'Delete',
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            visualDensity:
                                                VisualDensity.compact,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

class _InfoBadge extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final Color bgColor;

  const _InfoBadge({
    required this.text,
    required this.icon,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const Gap(4),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final bool isItalic;

  const _DetailRow({
    required this.icon,
    required this.text,
    required this.color,
    this.isItalic = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 14, color: color.withValues(alpha: 0.7)),
        ),
        const Gap(6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }
}
