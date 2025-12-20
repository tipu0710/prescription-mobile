import 'package:babosthapotro/core/utils/toast_service.dart';
import 'package:babosthapotro/features/auth/presentation/widgets/auth_toggle_switch.dart';
import 'package:babosthapotro/presentation/widgets/custom_elevated_button.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/presentation/widgets/password_input_widget.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/signup_params.dart';
import '../providers/auth_provider.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _bmdcController = TextEditingController();

  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(authControllerProvider.notifier)
          .signup(
            SignupParams(
              email: _emailController.text,
              bmdcNumber: _bmdcController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bmdcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider, (previous, next) {
      if (next is AsyncError) {
        ToastService.showError(context, message: next.error.toString());
      } else if (next is AsyncData) {
        ToastService.showSuccess(
          context,
          message: "Account created! Please verify your email.",
        );
        context.go('/signin');
      }
    });

    final state = ref.watch(authControllerProvider);
    final isLoading = state.isLoading;
    final colors = context.appColor;

    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Header Logo & Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'auth-logo',
                      child: Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colors.foreground.withValues(alpha: 0.2),
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/icon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const Gap(12),
                    Hero(
                      tag: 'auth-title',
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          'Babosthapotro',
                          style: context.textStyle.displayLarge.copyWith(
                            color: colors.foreground,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                Hero(
                  tag: 'auth-description',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      'Join to manage prescriptions and templates',
                      textAlign: TextAlign.center,
                      style: context.textStyle.bodyMedium.copyWith(
                        color: colors.mutedForeground,
                      ),
                    ),
                  ),
                ),
                const Gap(32),

                // Toggle Switch
                Hero(
                  tag: 'auth-switch',
                  child: AuthToggleSwitch(
                    isSignIn: false,
                    onSignInTap: () => context.go('/signin'),
                    onSignUpTap: () {},
                  ),
                ),

                const Gap(32),

                // Card Container
                Hero(
                  tag: 'auth-card',
                  child: Material(
                    color: colors.card,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      side: BorderSide(color: colors.border, width: 1.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              // Email Field
                              CustomTextFormField(
                                controller: _emailController,
                                hintText: 'Email address',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: colors.mutedForeground,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  final emailRegex = RegExp(
                                    r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                                  );
                                  if (!emailRegex.hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                              const Gap(16),

                              // BMDC Number Field
                              CustomTextFormField(
                                controller: _bmdcController,
                                hintText: 'BM&DC Registration Number',
                                prefixIcon: Icon(
                                  Icons.badge_outlined,
                                  color: colors.mutedForeground,
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(6),
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your BM&DC number';
                                  }
                                  return null;
                                },
                              ),
                              const Gap(16),

                              // Password Field
                              PasswordInput(controller: _passwordController),

                              const Gap(24),

                              // Create Account Button
                              CustomElevatedButton(
                                onPressed: _handleSignup,
                                text: 'Create account',
                                isLoading: isLoading,
                              ),

                              const Gap(16),

                              // Terms
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: context.textStyle.bodySmall.copyWith(
                                    color: colors.mutedForeground,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: 'By signing up, you agree to our ',
                                    ),
                                    TextSpan(
                                      text: 'Terms and\nPrivacy Policy',
                                      style: context.textStyle.bodySmall
                                          .copyWith(
                                            color: colors.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const Gap(32),
                Hero(
                  tag: 'auth-extra',
                  child: TextButton(
                    onPressed: () => context.go('/signin'),
                    child: RichText(
                      textAlign: .center,
                      text: TextSpan(
                        style: context.textStyle.bodyMedium.copyWith(
                          color: colors.mutedForeground,
                        ),

                        children: [
                          const TextSpan(text: "Already have an account? "),
                          TextSpan(
                            text: "Sign in",
                            style: TextStyle(
                              color: colors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Gap(48),
                Hero(
                  tag: 'auth-help',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      "Need help? Contact support",
                      style: context.textStyle.bodyMedium.copyWith(
                        color: colors.mutedForeground,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
