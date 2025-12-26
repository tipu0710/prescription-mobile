import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/auth_routes.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/widgets/scaffold_with_nav_bar.dart';
import '../../features/prescription/presentation/pages/prescription_page.dart';
import '../../features/profile/presentation/pages/account_page.dart';
import '../../features/profile/presentation/widgets/profile_guard.dart';
import '../../features/templates/presentation/pages/templates_page.dart';
import '../local_storage/storage_service.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final storage = ref.watch(storageServiceProvider);

  // We need a GlobalKey for the Navigator to use context in redirect if needed (though context is provided in redirect)
  final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  // final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    refreshListenable: storage,
    initialLocation: AuthRoutes.signin,
    redirect: (context, state) {
      final token = storage.getToken();
      final isLoggingIn = state.uri.path == AuthRoutes.signin;
      final isRegistering = state.uri.path == AuthRoutes.signup;
      final isRecovering = state.uri.path.startsWith('/auth/forgot-password');

      // If user is authenticated and trying to access auth pages, redirect to dashboard
      if (token != null && (isLoggingIn || isRegistering || isRecovering)) {
        return '/dashboard';
      }

      // If user is NOT authenticated and trying to access protected pages (like dashboard),
      // redirect to signin.
      if (token == null && !isLoggingIn && !isRegistering && !isRecovering) {
        return AuthRoutes.signin;
      }

      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/dashboard',
                builder: (context, state) =>
                    const ProfileGuard(child: HomePage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/prescriptions',
                builder: (context, state) =>
                    const ProfileGuard(child: PrescriptionPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/templates',
                builder: (context, state) =>
                    const ProfileGuard(child: TemplatesPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/account',
                builder: (context, state) => const AccountPage(),
              ),
            ],
          ),
        ],
      ),
      ...AuthRoutes.routes,
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.uri.path}')),
    ),
  );
});
