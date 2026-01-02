import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:babosthapotro/presentation/widgets/custom_elevated_button.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/features/home/domain/entities/investigation.dart';
import 'package:babosthapotro/features/home/data/repositories/home_repository.dart';

class AddInvestigationBottomSheet extends ConsumerStatefulWidget {
  const AddInvestigationBottomSheet({super.key});

  @override
  ConsumerState<AddInvestigationBottomSheet> createState() =>
      _AddInvestigationBottomSheetState();
}

class _AddInvestigationBottomSheetState
    extends ConsumerState<AddInvestigationBottomSheet> {
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
