import 'package:flutter/material.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double borderRadius;
  final double? width;
  final double height;
  final TextStyle? textStyle;
  final double elevation;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius = 12,
    this.width = double.infinity,
    this.height = 50,
    this.textStyle,
    this.elevation = 0,
    this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? colors.primary,
          foregroundColor: foregroundColor ?? colors.primaryForeground,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: elevation,
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foregroundColor ?? colors.primaryForeground,
                ),
              )
            : child ??
                  Text(
                    text,
                    style:
                        textStyle ??
                        context.textStyle.labelLarge.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
      ),
    );
  }
}
