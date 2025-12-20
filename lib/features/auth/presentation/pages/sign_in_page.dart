import 'package:babosthapotro/features/auth/domain/entities/login_params.dart';
import 'package:babosthapotro/features/auth/presentation/widgets/auth_toggle_switch.dart';
import 'package:babosthapotro/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/presentation/widgets/custom_elevated_button.dart';
import 'package:babosthapotro/features/auth/presentation/widgets/password_input_widget.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:babosthapotro/core/utils/toast_service.dart';
import '../providers/auth_provider.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(authControllerProvider.notifier)
          .login(
            LoginParams(
              credential: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Colors retrieved from theme extension
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
                          image: DecorationImage(
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
                      'Sign in to manage prescriptions and templates',
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
                    isSignIn: true,
                    onSignInTap: () {},
                    onSignUpTap: () => context.push('/signup'),
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            const Gap(16),

                            // Password Field
                            PasswordInput(controller: _passwordController),

                            const Gap(24),

                            // Continue Button
                            Consumer(
                              builder: (context, ref, child) {
                                final authState = ref.watch(
                                  authControllerProvider,
                                );
                                final isLoading = authState.isLoading;

                                // Listen for success/error
                                ref.listen(authControllerProvider, (
                                  previous,
                                  next,
                                ) {
                                  next.whenOrNull(
                                    data: (_) {
                                      ToastService.showSuccess(
                                        context,
                                        message: "Login successful!",
                                      );
                                      context.go('/dashboard');
                                    },
                                    error: (error, stackTrace) {
                                      ToastService.showError(
                                        context,
                                        message: error.toString(),
                                      );
                                    },
                                  );
                                });

                                return CustomElevatedButton(
                                  onPressed: _handleLogin,
                                  text: 'Continue',
                                  isLoading: isLoading,
                                );
                              },
                            ),

                            const Gap(16),

                            // Terms
                            const TermsAndConditions(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const Gap(24),
                Hero(
                  tag: 'auth-extra',
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: context.textStyle.labelLarge.copyWith(
                        color: colors.foreground,
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
