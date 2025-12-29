import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/local_storage/storage_service.dart';
import '../../../../theme/theme_extensions.dart';
import '../../../auth/presentation/providers/user_provider.dart';
import '../providers/profile_verification_provider.dart';
import '../providers/degrees_provider.dart';
import '../widgets/profile_section.dart';
import '../widgets/chambers_section.dart';
import '../widgets/degrees_section.dart';
import '../providers/chambers_provider.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _initialCheckDone = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verificationAsync = ref.watch(profileVerificationProvider);
    final isComplete = verificationAsync.asData?.value ?? false;

    // Wait for degrees and chambers to be loaded before running initial check
    final degreesAsync = ref.watch(degreesProvider);
    final chambersAsync = ref.watch(chambersProvider);

    if (!_initialCheckDone &&
        !degreesAsync.isLoading &&
        !chambersAsync.isLoading) {
      if (degreesAsync.hasValue && chambersAsync.hasValue) {
        final profile = ref.read(userProvider).asData?.value;
        final degrees = degreesAsync.value!;
        final chambers = chambersAsync.value!;

        if (profile?.isComplete ?? false) {
          if (degrees.isEmpty) {
            // Schedule the navigation to avoid "setState() during build"
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && _tabController.index != 1) {
                _tabController.animateTo(1);
              }
            });
          } else if (chambers.isEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted && _tabController.index != 2) {
                _tabController.animateTo(2);
              }
            });
          }
        }
        // Mark check as done so we don't re-run it
        // We do this synchronously layout-wise to prevent re-entering
        _initialCheckDone = true;
      }
    }

    // Listen to Profile Changes
    ref.listen(userProvider, (prev, next) {
      final prevComplete = prev?.asData?.value.isComplete ?? false;
      final nextComplete = next.asData?.value.isComplete ?? false;

      if (!prevComplete && nextComplete) {
        // Profile just completed, move to degrees or chambers
        final degrees = ref.read(degreesProvider).asData?.value ?? [];
        if (degrees.isNotEmpty) {
          _tabController.animateTo(2);
        } else {
          _tabController.animateTo(1);
        }
      }
    });

    // Listen to Degree Changes

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(storageServiceProvider).clearSession();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Profile"),
            Tab(text: "Degrees"),
            Tab(text: "Chambers"),
          ],
        ),
      ),
      body: Column(
        children: [
          if (!isComplete)
            Material(
              color: context.appColor.warning.withValues(alpha: 0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: context.appColor.warning,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Your profile is incomplete. Please update all sections.",
                        style: context.textStyle.bodyMedium.copyWith(
                          color: context.appColor.warning,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ref.invalidate(profileVerificationProvider);
                      },
                      child: const Text("Refresh"),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ProfileSection(),
                DegreesSection(),
                ChambersSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
