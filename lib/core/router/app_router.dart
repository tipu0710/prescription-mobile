import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/auth_routes.dart';
import '../../app.dart'; // Import for HomePage

class AppRouter {
  static final router = GoRouter(
    initialLocation: AuthRoutes.signin, // Start at Sign In
    routes: [
      GoRoute(
        path: '/dashboard', // Matches frontend dashboard path
        builder: (context, state) =>
            const HomePage(), // HomePage is our Dashboard for now
      ),
      ...AuthRoutes.routes,
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.uri.path}')),
    ),
  );
}
