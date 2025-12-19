import 'package:babosthapotro/theme/app_color_interface.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class AuthToggleSwitch extends StatelessWidget {
  final bool isSignIn;
  final VoidCallback onSignInTap;
  final VoidCallback onSignUpTap;

  const AuthToggleSwitch({
    super.key,
    required this.isSignIn,
    required this.onSignInTap,
    required this.onSignUpTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;

    return Container(
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.border),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            context,
            text: 'Sign In',
            isSelected: isSignIn,
            onTap: onSignInTap,
            colors: colors,
          ),
          const SizedBox(width: 8),
          _buildButton(
            context,
            text: 'Sign Up',
            isSelected: !isSignIn,
            onTap: onSignUpTap,
            colors: colors,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    required AppColorInterface colors,
  }) {
    // Style adjustments
    final textColor = isSelected ? colors.foreground : colors.mutedForeground;
    final bgColor = isSelected ? colors.input : Colors.transparent;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: context.textStyle.labelLarge.copyWith(
            color: textColor,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
