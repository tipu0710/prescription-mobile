import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import '../../data/repositories/home_repository.dart';
import '../providers/home_provider.dart';
import '../widgets/welcome_section.dart';
import '../widgets/template_card.dart';
import '../widgets/sponsored_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;
    final styles = context.textStyle;

    final templatesState = ref.watch(
      templateListProvider(
        search: _searchController.text.isNotEmpty
            ? _searchController.text
            : null,
      ),
    );
    final sponsoredState = ref.watch(sponsoredProvider);

    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(templateListProvider);
            ref.invalidate(sponsoredProvider);
          },
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const WelcomeSection(),
                    const SizedBox(height: 24),
                    Text(
                      'Your Prescription Templates',
                      style: styles.titleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.foreground,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        // Debounce could be added here
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: 'Search templates...',
                        prefixIcon: Icon(
                          Icons.search,
                          color: colors.mutedForeground,
                        ),
                        filled: true,
                        fillColor: colors.card,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ]),
                ),
              ),
              templatesState.when(
                data: (response) {
                  if (response.results.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            'No templates found.',
                            style: styles.bodyMedium.copyWith(
                              color: colors.mutedForeground,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final template = response.results[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: TemplateCard(
                            template: template,
                            onUse: () {
                              // TODO: Use template
                            },
                            onEdit: () {
                              // TODO: Edit template
                            },
                            onDelete: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Delete Template'),
                                  content: Text(
                                    'Are you sure you want to delete "${template.name}"?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      style: TextButton.styleFrom(
                                        foregroundColor: colors.destructive,
                                      ),
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                ),
                              );

                              if (confirm == true) {
                                await ref
                                    .read(homeRepositoryProvider)
                                    .deleteTemplate(template.id);
                                ref.invalidate(templateListProvider);
                              }
                            },
                          ),
                        );
                      }, childCount: response.results.length),
                    ),
                  );
                },
                loading: () => const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                error: (err, stack) => SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Error loading templates: $err',
                      style: TextStyle(color: colors.destructive),
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    sponsoredState.when(
                      data: (sponsored) => SponsoredCard(sponsored: sponsored),
                      loading: () =>
                          const SizedBox.shrink(), // Don't show loader for sponsored to be less intrusive
                      error: (err, stack) =>
                          const SizedBox.shrink(), // Hide on error
                    ),
                    const SizedBox(height: 48), // Bottom padding
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
