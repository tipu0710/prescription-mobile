import 'package:flutter/material.dart';
import 'package:babosthapotro/theme/theme_extensions.dart';
import 'package:babosthapotro/features/home/data/models/sponsored.dart';
import 'package:url_launcher/url_launcher.dart';

class SponsoredCard extends StatelessWidget {
  final Sponsored sponsored;

  const SponsoredCard({super.key, required this.sponsored});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColor;
    final styles = context.textStyle;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.border),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            sponsored.image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 150,
              color: colors.muted,
              child: Center(
                child: Icon(
                  Icons.image_not_supported,
                  color: colors.mutedForeground,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sponsored.title,
                  style: styles.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colors.foreground,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  sponsored.description,
                  style: styles.bodyMedium.copyWith(
                    color: colors.mutedForeground,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () async {
                      final url = Uri.parse(sponsored.detailsUrl);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: colors.primary),
                      foregroundColor: colors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                    child: const Text('Learn More'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
