import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

enum ToastType { success, warning, error, info }

class ToastWidget extends StatelessWidget {
  final String message;
  final ToastType type;
  final String? title;
  final VoidCallback? onClose;

  const ToastWidget({
    super.key,
    required this.message,
    required this.type,
    this.title,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;
    final textStyles = context.textStyle;

    Color primaryColor;
    Color backgroundColor;
    Color iconColor;
    IconData icon;

    switch (type) {
      case ToastType.success:
        primaryColor = colors.success;
        backgroundColor = colors.success.withValues(alpha: 0.1);
        iconColor = colors.success;
        icon = Icons.check_circle_outline;
        break;
      case ToastType.warning:
        primaryColor = colors.warning;
        backgroundColor = colors.warning.withValues(alpha: 0.1);
        iconColor = colors.warning;
        icon = Icons.warning_amber_rounded;
        break;
      case ToastType.error:
        primaryColor = colors.error;
        backgroundColor = colors.error.withValues(alpha: 0.1);
        iconColor = colors.error;
        icon = Icons.error_outline;
        break;
      case ToastType.info:
        primaryColor = colors.info;
        backgroundColor = colors.info.withValues(alpha: 0.1);
        iconColor = colors.info;
        icon = Icons.info_outline;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: colors.foreground.withValues(alpha: 0.05),
            offset: const Offset(0, 4),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Container
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: textStyles.titleSmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.foreground,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(
                  message,
                  style: textStyles.bodyMedium.copyWith(
                    color: colors.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
          // Close Button
          if (onClose != null)
            GestureDetector(
              onTap: onClose,
              child: Icon(Icons.close, color: colors.mutedForeground, size: 20),
            ),
        ],
      ),
    );
  }
}
