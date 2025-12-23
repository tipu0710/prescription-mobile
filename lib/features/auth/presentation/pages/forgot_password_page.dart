import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/presentation/widgets/custom_elevated_button.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:babosthapotro/core/network/api_error_handler.dart';
import 'package:babosthapotro/core/utils/toast_service.dart';
import '../providers/forgot_password_controller.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(forgotPasswordControllerProvider.notifier)
          .requestPasswordReset(_emailController.text);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       height: 30,
                //       width: 30,
                //       padding: const EdgeInsets.all(8),
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         border: Border.all(
                //           color: colors.foreground.withValues(alpha: 0.2),
                //         ),
                //         image: const DecorationImage(
                //           image: AssetImage('assets/images/icon.png'),
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ),
                //     const Gap(12),
                //     Text(
                //       'Babosthapotro',
                //       style: context.textStyle.displayLarge.copyWith(
                //         color: colors.foreground,
                //       ),
                //     ),
                //   ],
                // ),
                // const Gap(32),

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
                            Icons.vpn_key_outlined,
                            color: colors.primary,
                            size: 24,
                          ),
                        ),
                        const Gap(24),

                        // Title
                        Text(
                          'Forgot password?',
                          style: context.textStyle.displayMedium.copyWith(
                            color: colors.foreground,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(8),

                        // Description
                        Text(
                          "Enter your email address and we'll send you a code to reset your password.",
                          textAlign: TextAlign.center,
                          style: context.textStyle.bodyMedium.copyWith(
                            color: colors.mutedForeground,
                          ),
                        ),
                        const Gap(32),

                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
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
                                  // Simple email validation
                                  final emailRegex = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                  );
                                  if (!emailRegex.hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const Gap(24),

                              Consumer(
                                builder: (context, ref, child) {
                                  final state = ref.watch(
                                    forgotPasswordControllerProvider,
                                  );
                                  final isLoading = state.isLoading;

                                  ref.listen(forgotPasswordControllerProvider, (
                                    previous,
                                    next,
                                  ) {
                                    next.whenOrNull(
                                      data: (_) {
                                        context.push(
                                          '/reset-password',
                                          extra: _emailController.text,
                                        );
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
                                    text: 'Send Reset Code',
                                    isLoading: isLoading,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (!isLoading) ...[
                                          const Icon(
                                            Icons.vpn_key_outlined,
                                            size: 20,
                                          ),
                                          const Gap(8),
                                        ],
                                        const Text(
                                          'Send Reset Code',
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

                        const Gap(16),

                        TextButton(
                          onPressed: () => context.go('/signin'),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: 16,
                                color: colors.mutedForeground,
                              ),
                              const Gap(8),
                              Text(
                                'Back to sign in',
                                style: context.textStyle.bodyMedium.copyWith(
                                  color: colors.mutedForeground,
                                  fontWeight: FontWeight.w500,
                                ),
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
