import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/pages/webview_page.dart';
import 'presentation/pages/sign_in_page.dart';
import 'presentation/pages/sign_up_page.dart';
import 'presentation/pages/otp_verification_page.dart';
import 'presentation/pages/forgot_password_page.dart';
import 'presentation/pages/reset_password_page.dart';

class AuthRoutes {
  static const String signin = '/signin';
  static const String signup = '/signup';

  static List<GoRoute> get routes => [
    GoRoute(
      path: signin,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SignInPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: signup,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SignUpPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    ),
    GoRoute(
      path: '/webview',
      builder: (context, state) {
        final extras = state.extra as Map<String, dynamic>;
        return WebViewPage(
          url: extras['url'] as String,
          title: extras['title'] as String,
        );
      },
    ),
    GoRoute(
      path: '/verify',
      builder: (context, state) {
        final email = state.extra as String;
        return OTPVerificationPage(email: email);
      },
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) {
        final email = state.extra as String;
        return ResetPasswordPage(email: email);
      },
    ),
  ];
}
