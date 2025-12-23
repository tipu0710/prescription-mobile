import 'package:babosthapotro/presentation/widgets/custom_text_form_field.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;

  const PasswordInput({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;
    return CustomTextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      hintText: widget.hintText ?? 'Password',
      fillColor: colors.input,
      borderColor: colors.border,
      focusedBorderColor: colors.primary,
      style: TextStyle(color: colors.foreground),
      hintStyle: TextStyle(color: colors.mutedForeground),
      prefixIcon: Icon(Icons.lock_outline, color: colors.mutedForeground),
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: colors.mutedForeground,
        ),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      ),
      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
    );
  }
}
