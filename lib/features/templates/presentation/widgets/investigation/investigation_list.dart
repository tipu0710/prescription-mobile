import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:babosthapotro/features/home/domain/entities/investigation.dart';

class InvestigationList extends StatelessWidget {
  final List<Investigation> investigations;
  final VoidCallback onAdd;
  final Function(int) onDelete;

  const InvestigationList({
    super.key,
    required this.investigations,
    required this.onAdd,
    required this.onDelete,
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
              'Investigations',
              style: styles.titleMedium.copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
          ],
        ),
        if (investigations.isEmpty)
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
            itemCount: investigations.length,
            separatorBuilder: (_, _) => const Gap(8),
            itemBuilder: (context, index) {
              final item = investigations[index];
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
                    onPressed: () => onDelete(index),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
