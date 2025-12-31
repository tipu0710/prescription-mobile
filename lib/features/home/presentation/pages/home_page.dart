import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:babosthapotro/data/api/api_client.dart';
import '../../data/repositories/home_repository.dart';
import '../providers/home_provider.dart';
import '../providers/template_provider.dart';
import '../widgets/template_card.dart';
import '../widgets/sponsored_card.dart';
import 'package:babosthapotro/core/presentation/widgets/empty_state_widget.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import '../../../auth/presentation/providers/user_provider.dart';
import '../widgets/template_list_shimmer.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(templateListProvider.notifier).loadMore();
    }
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;
    final styles = context.textStyle;

    final templatesState = ref.watch(templateListProvider);
    final sponsoredState = ref.watch(sponsoredProvider);
    final userState = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref
                .read(templateListProvider.notifier)
                .performSearch(_searchController.text);
            ref.invalidate(sponsoredProvider);
            ref.invalidate(userProvider);
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // Greeting Section
                    userState.when(
                      data: (user) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${_getGreeting()},',
                            style: styles.bodyMedium.copyWith(
                              color: colors.mutedForeground,
                            ),
                          ),
                          Text(
                            "Dr. ${user.fullName ?? 'Doctor'}",
                            style: styles.headlineMedium.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colors.foreground,
                            ),
                          ),
                        ],
                      ),
                      loading: () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 16,
                            decoration: BoxDecoration(
                              color: colors.muted.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 200,
                            height: 32,
                            decoration: BoxDecoration(
                              color: colors.muted.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                      error: (e, s) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 24),

                    Text(
                      'Your Prescription Templates',
                      style: styles.titleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.foreground,
                      ),
                    ),
                    const SizedBox(height: 12),

                    CustomTextFormField(
                      controller: _searchController,
                      hintText: 'Search templates...',
                      prefixIcon: Icon(
                        Icons.search,
                        color: colors.mutedForeground,
                      ),
                      fillColor: colors.card,
                      onChanged: (value) {
                        ref
                            .read(templateListProvider.notifier)
                            .performSearch(value);
                      },
                    ),
                    const SizedBox(height: 16),
                  ]),
                ),
              ),
              templatesState.when(
                data: (response) {
                  if (response.results.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: EmptyStateWidget(
                        icon: Icons.description_outlined,
                        message: 'No templates found',
                        subMessage: 'Create a new template to get started.',
                        actionLabel: 'Create Template',
                        onAction: () {
                          context.go('/templates');
                        },
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
                                ref
                                    .read(templateListProvider.notifier)
                                    .refresh();
                              }
                            },
                          ),
                        );
                      }, childCount: response.results.length),
                    ),
                  );
                },
                loading: () =>
                    const SliverToBoxAdapter(child: TemplateListShimmer()),
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
                      data: (sponsored) => SponsoredCard(
                        sponsored: sponsored,
                        onLearnMore: () {
                          ref
                              .read(apiClientProvider)
                              .trackSponsoredClick(sponsored.id);
                        },
                      ),
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
