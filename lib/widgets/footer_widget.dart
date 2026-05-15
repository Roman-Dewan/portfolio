import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../data/dummy_models/portfolio_data.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(color: AppColors.border.withValues(alpha: 0.4)),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.code, color: AppColors.primary, size: 18),
              const SizedBox(width: 8),
              Text(
                "Crafted with Flutter & Clean Architecture",
                style: AppTextStyles.monospace(fontSize: 13, color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Designed & Developed by ${PortfolioData.name}",
            style: AppTextStyles.bodyText(color: AppColors.textPrimary, fontSize: 14).copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            "© ${DateTime.now().year} All rights reserved.",
            style: AppTextStyles.bodyText(color: AppColors.textSecondary, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
