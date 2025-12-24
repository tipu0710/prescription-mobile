import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/auth_routes.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../local_storage/storage_service.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final storage = ref.watch(storageServiceProvider);

  return GoRouter(
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
      // For now, we assume everything except auth routes is protected.
      if (token == null && !isLoggingIn && !isRegistering && !isRecovering) {
        return AuthRoutes.signin;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const HomePage(),
      ),
      ...AuthRoutes.routes,
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.uri.path}')),
    ),
  );
});
