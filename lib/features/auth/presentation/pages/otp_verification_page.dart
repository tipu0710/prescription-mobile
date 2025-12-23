import 'package:babosthapotro/core/network/api_error_handler.dart';
import 'package:babosthapotro/core/utils/toast_service.dart';
import 'package:babosthapotro/presentation/widgets/custom_elevated_button.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../providers/otp_verification_controller.dart';
import '../providers/otp_resend_timer_provider.dart';

class OTPVerificationPage extends ConsumerStatefulWidget {
  final String email;

  const OTPVerificationPage({super.key, required this.email});

  @override
  ConsumerState<OTPVerificationPage> createState() =>
      _OTPVerificationPageState();
}

class _OTPVerificationPageState extends ConsumerState<OTPVerificationPage> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _handleVerify() async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(otpVerificationControllerProvider.notifier)
          .verifyOtp(widget.email, _pinController.text);

      if (mounted) {
        final state = ref.read(otpVerificationControllerProvider);
        if (state.hasValue && !state.hasError) {
          ToastService.showSuccess(
            context,
            message: "Verification successful! Please login.",
          );
          context.go('/signin');
        }
      }
    }
  }

  void _handleResend() {
    if (ref.read(otpResendTimerProvider) == 0) {
      ref
          .read(otpVerificationControllerProvider.notifier)
          .resendOtp(widget.email, 'VERIFICATION');
      ref.read(otpResendTimerProvider.notifier).restart();
      ToastService.showSuccess(context, message: "Code sent again!");
    }
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.foreground),
          onPressed: () => context.go('/signin'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo & Title
                Hero(
                  tag: 'auth-logo',
                  child: Container(
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(12),
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
                const Gap(24),
                Hero(
                  tag: 'auth-title',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      'Verification',
                      style: context.textStyle.displayMedium.copyWith(
                        color: colors.foreground,
                      ),
                    ),
                  ),
                ),
                const Gap(16),
                Text(
                  'Enter the code sent to ${widget.email}',
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodyMedium.copyWith(
                    color: colors.mutedForeground,
                  ),
                ),
                const Gap(32),

                Form(
                  key: _formKey,
                  child: Pinput(
                    length: 6,
                    controller: _pinController,
                    focusNode: _focusNode,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    errorPinTheme: errorPinTheme,
                    validator: (value) {
                      if (value == null || value.length != 6) {
                        return 'Enter 6-digit code';
                      }
                      return null;
                    },
                    onCompleted: (pin) => _handleVerify(),
                  ),
                ),
                const Gap(32),

                Consumer(
                  builder: (context, ref, child) {
                    final authState = ref.watch(
                      otpVerificationControllerProvider,
                    );
                    final isLoading = authState.isLoading;

                    ref.listen(otpVerificationControllerProvider, (
                      previous,
                      next,
                    ) {
                      next.whenOrNull(
                        error: (error, stackTrace) {
                          ToastService.showError(
                            context,
                            message: ApiErrorHandler.getErrorMessage(error),
                          );
                        },
                      );
                    });

                    return CustomElevatedButton(
                      onPressed: _handleVerify,
                      text: 'Verify',
                      isLoading: isLoading,
                    );
                  },
                ),

                const Gap(24),
                Consumer(
                  builder: (context, ref, child) {
                    final timerSeconds = ref.watch(otpResendTimerProvider);
                    final canResend = timerSeconds == 0;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't receive code?",
                          style: context.textStyle.bodyMedium.copyWith(
                            color: colors.mutedForeground,
                          ),
                        ),
                        TextButton(
                          onPressed: canResend ? _handleResend : null,
                          child: Text(
                            canResend ? 'Resend' : 'Resend in $timerSeconds s',
                            style: context.textStyle.bodyMedium.copyWith(
                              color: canResend
                                  ? colors.primary
                                  : colors.mutedForeground,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
