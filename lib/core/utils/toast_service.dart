import 'package:babosthapotro/presentation/widgets/toast_widget.dart';
import 'package:flutter/material.dart';

class ToastService {
  static void _show(
    BuildContext context, {
    required String message,
    required ToastType type,
    String? title,
    Duration duration = const Duration(seconds: 4),
  }) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: ToastWidget(
          message: message,
          type: type,
          title: title,
          onClose: () => messenger.hideCurrentSnackBar(),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        duration: duration,
      ),
    );
  }

  static void showSuccess(
    BuildContext context, {
    required String message,
    String? title = "Success",
  }) {
    _show(context, message: message, type: ToastType.success, title: title);
  }

  static void showWarning(
    BuildContext context, {
    required String message,
    String? title = "Warning",
  }) {
    _show(context, message: message, type: ToastType.warning, title: title);
  }

  static void showError(
    BuildContext context, {
    required String message,
    String? title = "Error",
  }) {
    _show(context, message: message, type: ToastType.error, title: title);
  }

  static void showInfo(
    BuildContext context, {
    required String message,
    String? title = "Info",
  }) {
    _show(context, message: message, type: ToastType.info, title: title);
  }
}
