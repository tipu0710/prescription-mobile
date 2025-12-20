import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: context.textStyle.bodySmall.copyWith(
          color: context.appColor.mutedForeground,
        ),
        children: [
          const TextSpan(text: 'By continuing, you agree to our '),
          TextSpan(
            text: 'Terms and Privacy Policy',
            style: context.textStyle.bodySmall.copyWith(
              color: context.appColor.primary,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.push(
                  '/webview',
                  extra: {
                    'url': 'https://babosthapotro.com/terms',
                    'title': 'Terms and Privacy Policy',
                  },
                );
              },
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
