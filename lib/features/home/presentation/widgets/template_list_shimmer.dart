import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';

class TemplateListShimmer extends StatelessWidget {
  const TemplateListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
        baseColor: colors.muted.withValues(alpha: 0.1),
        highlightColor: colors.muted.withValues(alpha: 0.05),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
