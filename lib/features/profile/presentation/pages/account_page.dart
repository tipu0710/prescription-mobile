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

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Initial navigation logic after frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkInitialNavigation();
    });
  }

  void _checkInitialNavigation() {
    if (!mounted) return;
    // Use asData?.value to safely access AsyncValue
    final profile = ref.read(userProvider).asData?.value;
    final degrees = ref.read(degreesProvider).asData?.value ?? [];

    if (profile?.isComplete ?? false) {
      if (degrees.isNotEmpty) {
        if (_tabController.index != 2) _tabController.animateTo(2); // Chambers
      } else {
        if (_tabController.index != 1) _tabController.animateTo(1); // Degrees
      }
    }
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
    ref.listen(degreesProvider, (prev, next) {
      final prevEmpty = prev?.asData?.value.isEmpty ?? true;
      final nextNotEmpty = next.asData?.value.isNotEmpty ?? false;

      if (prevEmpty && nextNotEmpty) {
        // Degrees just added
        final profile = ref.read(userProvider).asData?.value;
        if (profile?.isComplete ?? false) {
          _tabController.animateTo(2);
        }
      }
    });

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
