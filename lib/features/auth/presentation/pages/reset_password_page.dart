import 'package:babosthapotro/presentation/widgets/custom_elevated_button.dart';
import 'package:babosthapotro/features/auth/presentation/widgets/password_input_widget.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:babosthapotro/core/network/api_error_handler.dart';
import 'package:babosthapotro/core/utils/toast_service.dart';
import '../providers/reset_password_controller.dart';

class ResetPasswordPage extends ConsumerStatefulWidget {
  final String email;

  const ResetPasswordPage({super.key, required this.email});

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _pinFocusNode = FocusNode();

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      if (_newPasswordController.text != _confirmPasswordController.text) {
        ToastService.showError(context, message: "Passwords do not match");
        return;
      }

      ref
          .read(resetPasswordControllerProvider.notifier)
          .confirmPasswordReset(
            widget.email,
            _pinController.text,
            _newPasswordController.text,
          );
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;

    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: context.textStyle.titleLarge.copyWith(
        color: colors.foreground,
      ),
      decoration: BoxDecoration(
        color: colors.input,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.border),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: colors.primary),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: colors.destructive),
    );

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
                    Container(
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
                    const Gap(12),
                    Text(
                      'Babosthapotro',
                      style: context.textStyle.displayLarge.copyWith(
                        color: colors.foreground,
                      ),
                    ),
                  ],
                ),
                const Gap(32),

                // Card Container
                Material(
                  color: colors.card,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(color: colors.border, width: 1.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        // Icon
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: colors.secondary.withValues(alpha: 0.5),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: colors.border.withValues(alpha: 0.5),
                            ),
                          ),
                          child: Icon(
                            Icons.lock_outline,
                            color: colors.primary,
                            size: 24,
                          ),
                        ),
                        const Gap(24),

                        // Title
                        Text(
                          'Reset password',
                          textAlign: TextAlign.center,
                          style: context.textStyle.displayMedium.copyWith(
                            color: colors.foreground,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(8),

                        // Description
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: context.textStyle.bodyMedium.copyWith(
                              color: colors.mutedForeground,
                            ),
                            children: [
                              const TextSpan(text: 'Enter the code sent to '),
                              TextSpan(
                                text: widget.email,
                                style: TextStyle(
                                  color: colors.foreground,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(text: ' and your new password.'),
                            ],
                          ),
                        ),
                        const Gap(32),

                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // OTP Field
                              Center(
                                child: Pinput(
                                  length: 6,
                                  controller: _pinController,
                                  focusNode: _pinFocusNode,
                                  defaultPinTheme: defaultPinTheme,
                                  focusedPinTheme: focusedPinTheme,
                                  errorPinTheme: errorPinTheme,
                                  validator: (value) {
                                    if (value == null || value.length != 6) {
                                      return 'Enter 6-digit code';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const Gap(24),

                              // New Password
                              PasswordInput(
                                controller: _newPasswordController,
                                hintText: 'New Password',
                                validator: (value) {
                                  if (value == null || value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              const Gap(16),

                              // Confirm Password
                              PasswordInput(
                                controller: _confirmPasswordController,
                                hintText: 'Confirm Password',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  }
                                  return null;
                                },
                              ),
                              const Gap(24),

                              Consumer(
                                builder: (context, ref, child) {
                                  final state = ref.watch(
                                    resetPasswordControllerProvider,
                                  );
                                  final isLoading = state.isLoading;

                                  ref.listen(resetPasswordControllerProvider, (
                                    previous,
                                    next,
                                  ) {
                                    next.whenOrNull(
                                      data: (_) {
                                        ToastService.showSuccess(
                                          context,
                                          message:
                                              "Password reset successfully! Please login.",
                                        );
                                        context.go('/signin');
                                      },
                                      error: (error, stackTrace) {
                                        ToastService.showError(
                                          context,
                                          message:
                                              ApiErrorHandler.getErrorMessage(
                                                error,
                                              ),
                                        );
                                      },
                                    );
                                  });

                                  return CustomElevatedButton(
                                    onPressed: _handleSubmit,
                                    text: 'Reset Password',
                                    isLoading: isLoading,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (!isLoading) ...[
                                          const Icon(Icons.lock_open, size: 20),
                                          const Gap(8),
                                        ],
                                        const Text(
                                          'Reset Password',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
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
