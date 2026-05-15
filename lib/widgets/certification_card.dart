import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../models/certification_model.dart';

class CertificationCard extends StatelessWidget {
  final CertificationModel certification;

  const CertificationCard({
    super.key,
    required this.certification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19),
        child: Stack(
          children: [
            // Left gradient indicator bar
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 4,
              child: Container(color: AppColors.primary),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          certification.year,
                          style: AppTextStyles.monospace(fontSize: 12, color: AppColors.primary).copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(Icons.verified, size: 20, color: AppColors.primary.withValues(alpha: 0.6)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    certification.title,
                    style: AppTextStyles.sectionTitle(isMobile: true).copyWith(fontSize: 18, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    certification.issuer,
                    style: AppTextStyles.bodyText(fontSize: 13, color: AppColors.secondary),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Text(
                        certification.description,
                        style: AppTextStyles.bodyText(fontSize: 14),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
