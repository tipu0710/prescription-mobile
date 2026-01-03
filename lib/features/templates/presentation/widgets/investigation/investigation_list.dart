import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:babosthapotro/features/home/domain/entities/investigation.dart';

import 'package:babosthapotro/features/templates/presentation/controllers/investigation_search_controller.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestigationList extends ConsumerStatefulWidget {
  final List<Investigation> investigations;
  final Function(Investigation) onAdd;
  final Function(int) onDelete;

  const InvestigationList({
    super.key,
    required this.investigations,
    required this.onAdd,
    required this.onDelete,
  });

  @override
  ConsumerState<InvestigationList> createState() => _InvestigationListState();
}

class _InvestigationListState extends ConsumerState<InvestigationList> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Keep provider alive
    ref.watch(investigationSearchControllerProvider);

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
          ],
        ),
        const Gap(12),
        RawAutocomplete<Investigation>(
          textEditingController: _searchController,
          focusNode: _focusNode,
          displayStringForOption: (Investigation option) => option.name,
          optionsBuilder: (TextEditingValue textEditingValue) async {
            final query = textEditingValue.text;
            debugPrint('Searching investigation: $query');
            // Use controller to search
            await ref
                .read(investigationSearchControllerProvider.notifier)
                .search(query);
            // Return results from state
            final state = ref.read(investigationSearchControllerProvider);
            debugPrint('Search results: ${state.value?.length}');
            return state.value ?? [];
          },
          onSelected: (Investigation selection) {
            widget.onAdd(selection);
            _searchController.clear();
            ref.read(investigationSearchControllerProvider.notifier).clear();
            _focusNode.requestFocus(); // Keep focus for rapid entry
          },
          fieldViewBuilder:
              (context, controller, focusNode, onEditingComplete) {
                return CustomTextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  hintText: 'Search & Add Investigation',
                  prefixIcon: const Icon(Icons.search),
                  onEditingComplete: onEditingComplete,
                );
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
                    maxHeight: 200,
                    maxWidth:
                        MediaQuery.of(context).size.width - 32, // Adjust width
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
                          child: Text(option.name, style: styles.bodyMedium),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
        const Gap(16),

        if (widget.investigations.isEmpty)
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
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.investigations.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Container(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.name,
                        style: styles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(8),
                      InkWell(
                        onTap: () => widget.onDelete(index),
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: colors.destructive,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
