import 'package:babosthapotro/core/utils/toast_service.dart';
import 'package:babosthapotro/features/auth/presentation/widgets/auth_toggle_switch.dart';
import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/presentation/widgets/theme_toggle_button.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Simulate network request
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => _isLoading = false);
        // For now just show success and navigate (mock)
        ToastService.showSuccess(context, message: "Login successful!");
        context.go('/dashboard');
      }
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
                ThemeToggleButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colors.foreground.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Icon(
                        Icons.medical_services_outlined,
                        color: colors.foreground,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Babosthapotro',
                      style: context.textStyle.displayLarge.copyWith(
                        color: colors.foreground,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Sign in to manage prescriptions and templates',
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodyMedium.copyWith(
                    color: colors.mutedForeground,
                  ),
                ),
                const SizedBox(height: 32),

                // Toggle Switch
                AuthToggleSwitch(
                  isSignIn: true,
                  onSignInTap: () {},
                  onSignUpTap: () => context.push('/signup'),
                ),

                const SizedBox(height: 32),

                // Card Container
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: colors.card,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: colors.border, width: 1.5),
                  ),
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
                        const SizedBox(height: 16),

                        // Password Field
                        ValueListenableBuilder<bool>(
                          valueListenable: ValueNotifier<bool>(true),
                          builder: (context, obscure, child) {
                            return _PasswordInput(
                              controller: _passwordController,
                              fillColor: colors.input,
                              primaryColor: colors.primary,
                              foreground: colors.foreground,
                              mutedForeground: colors.mutedForeground,
                              borderColor: colors.border,
                            );
                          },
                        ),

                        const SizedBox(height: 24),

                        // Continue Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colors.primary,
                              foregroundColor: colors.primaryForeground,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: _isLoading
                                ? SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: colors.primaryForeground,
                                    ),
                                  )
                                : Text(
                                    'Continue',
                                    style: context.textStyle.labelLarge
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Terms
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: context.textStyle.bodySmall.copyWith(
                              color: colors.mutedForeground,
                            ),
                            children: [
                              const TextSpan(
                                text: 'By continuing, you agree to our ',
                              ),
                              TextSpan(
                                text: 'Terms and\nPrivacy Policy',
                                style: context.textStyle.bodySmall.copyWith(
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

                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: context.textStyle.labelLarge.copyWith(
                      color: colors.foreground,
                    ),
                  ),
                ),

                const SizedBox(height: 48),
                Text(
                  "Need help? Contact support",
                  style: context.textStyle.bodyMedium.copyWith(
                    color: colors.mutedForeground,
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

class _PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final Color fillColor;
  final Color primaryColor;

  final Color foreground;
  final Color mutedForeground;
  final Color borderColor;

  const _PasswordInput({
    required this.controller,
    required this.fillColor,
    required this.primaryColor,
    required this.foreground,
    required this.mutedForeground,
    required this.borderColor,
  });

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      hintText: 'Password',
      fillColor: widget.fillColor,
      borderColor: widget.borderColor,
      focusedBorderColor: widget.primaryColor,
      style: TextStyle(color: widget.foreground),
      hintStyle: TextStyle(color: widget.mutedForeground),
      prefixIcon: Icon(Icons.lock_outline, color: widget.mutedForeground),
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: widget.mutedForeground,
        ),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
