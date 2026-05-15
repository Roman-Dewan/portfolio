import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/dummy_models/portfolio_data.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/section_title.dart';
import '../../../widgets/skill_chip.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _isVisible = false;

  Future<void> _launchResume() async {
    final Uri url = Uri.parse(PortfolioData.resumeUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isDesktop = size.width >= 1024;
    final bool isMobile = size.width < 600;

    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.15 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 24 : 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: AppStrings.aboutMe,
              subtitle: "Get to know my professional background and engineering philosophy.",
            ),
            const SizedBox(height: 56),
            if (_isVisible)
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLeftCard(),
                        const SizedBox(width: 64),
                        Expanded(child: _buildRightContent()),
                      ],
                    )
                  : Column(
                      children: [
                        _buildLeftCard(),
                        const SizedBox(height: 40),
                        _buildRightContent(),
                      ],
                    )
            else
              const SizedBox(height: 300),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftCard() {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background,
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
            ),
            child: const Icon(Icons.auto_awesome, size: 50, color: AppColors.primary),
          ),
          const SizedBox(height: 24),
          Text(
            PortfolioData.name,
            style: AppTextStyles.sectionTitle(isMobile: true).copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            PortfolioData.tagline,
            style: AppTextStyles.bodyText(fontSize: 13, color: AppColors.primary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).animate().fade(duration: 600.ms).scaleXY(begin: 0.95, end: 1.0);
  }

  Widget _buildRightContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          PortfolioData.summary,
          style: AppTextStyles.bodyText(fontSize: 16),
        ).animate().fade(delay: 150.ms, duration: 600.ms).slideX(begin: 0.05, end: 0),
        const SizedBox(height: 32),
        // Premium Grid Stats
        LayoutBuilder(
          builder: (context, constraints) {
            final double gap = 16.0;
            final double itemWidth = constraints.maxWidth > 400 ? (constraints.maxWidth - gap) / 2 : constraints.maxWidth;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                _buildStatContainer(itemWidth, "1+", "Years Experience", AppColors.primary),
                _buildStatContainer(itemWidth, "5+", "Major Projects", AppColors.secondary),
                _buildStatContainer(itemWidth, "${PortfolioData.leetcodeCount}+", "LeetCode Solved", AppColors.primary),
                _buildStatContainer(itemWidth, "${PortfolioData.codeforcesCount}+", "Codeforces Solved", AppColors.secondary),
              ],
            );
          },
        ).animate().fade(delay: 300.ms, duration: 600.ms),
        const SizedBox(height: 40),
        Text(
          "Currently Learning & Exploring",
          style: AppTextStyles.sectionTitle(isMobile: true).copyWith(fontSize: 18),
        ).animate().fade(delay: 450.ms),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: PortfolioData.currentlyLearning
              .map((item) => SkillChip(label: item, color: AppColors.primary))
              .toList(),
        ).animate().fade(delay: 550.ms),
        const SizedBox(height: 40),
        CustomButton(
          label: "Download Full Resume",
          onTap: _launchResume,
          isOutlined: true,
        ).animate().fade(delay: 650.ms),
      ],
    );
  }

  Widget _buildStatContainer(double width, String val, String label, Color accentColor) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accentColor.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            val,
            style: AppTextStyles.heroName(context, isMobile: true).copyWith(
              fontSize: 32,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.bodyText(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
