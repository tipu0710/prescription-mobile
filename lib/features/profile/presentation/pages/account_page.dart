import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/local_storage/storage_service.dart';
import '../../../../theme/theme_extensions.dart';
import '../providers/profile_verification_provider.dart';
import '../widgets/profile_section.dart';
import '../widgets/chambers_section.dart';
import '../widgets/degrees_section.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verificationAsync = ref.watch(profileVerificationProvider);
    final isComplete = verificationAsync.value ?? false;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          bottom: const TabBar(
            tabs: [
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
                children: const [
                  ProfileSection(),
                  DegreesSection(),
                  ChambersSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
