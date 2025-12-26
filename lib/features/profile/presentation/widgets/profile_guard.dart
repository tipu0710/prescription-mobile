import 'package:flutter/material.dart';
import '../../../../theme/theme_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/profile_verification_provider.dart';

class ProfileGuard extends ConsumerWidget {
  final Widget child;
  const ProfileGuard({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verificationAsync = ref.watch(profileVerificationProvider);

    return verificationAsync.when(
      data: (isComplete) {
        if (!isComplete) {
          // Instead of showing a completion page, we should redirect to /account
          // However, in a build method we shouldn't trigger side effects like navigation directly
          // We can use a listener or just return a widget that does the redirect in initState

          // Better approach for shell route guard:
          // Since we are wrapping the page content, if we return Empty or Redirect widget,
          // it might be jarring.

          // Let's use a micro-task or just show a "Redirecting..." widget that calls go()
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (GoRouter.of(
                  context,
                ).routerDelegate.currentConfiguration.uri.path !=
                '/account') {
              context.go('/account');
            }
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return child;
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error verifying profile',
                style: context.textStyle.bodyLarge.copyWith(
                  color: context.appColor.destructive,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(profileVerificationProvider),
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
