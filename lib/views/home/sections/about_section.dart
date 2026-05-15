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
        padding: EdgeInsets.symmetric(
          vertical: 80,
          horizontal: isMobile ? 24 : 48,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: AppStrings.aboutMe,
              subtitle:
                  "Get to know my professional background and engineering philosophy.",
            ),
            const SizedBox(height: 56),
            if (_isVisible)
              _buildRightContent()
            else
              const SizedBox(height: 300),
          ],
        ),
      ),
    );
  }

  Widget _buildRightContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
              PortfolioData.aboutMe,
              style: AppTextStyles.bodyText(fontSize: 16),
              textAlign: TextAlign.center,
            )
            .animate()
            .fade(delay: 150.ms, duration: 600.ms)
            .slideY(begin: 0.05, end: 0),
        const SizedBox(height: 40),
        // Premium Grid Stats
        LayoutBuilder(
          builder: (context, constraints) {
            final double gap = 16.0;
            final double itemWidth = constraints.maxWidth > 400
                ? (constraints.maxWidth - gap) / 2
                : constraints.maxWidth;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              alignment: WrapAlignment.center,
              children: [
                _buildStatContainer(
                  itemWidth,
                  "1+",
                  "Years Experience",
                  AppColors.primary,
                ),
                _buildStatContainer(
                  itemWidth,
                  "5+",
                  "Major Projects",
                  AppColors.secondary,
                ),
                _buildStatContainer(
                  itemWidth,
                  "${PortfolioData.leetcodeCount}+",
                  "LeetCode Solved",
                  AppColors.primary,
                ),
                _buildStatContainer(
                  itemWidth,
                  "${PortfolioData.codeforcesCount}+",
                  "Codeforces Solved",
                  AppColors.secondary,
                ),
              ],
            );
          },
        ).animate().fade(delay: 300.ms, duration: 600.ms),
        const SizedBox(height: 48),
        Text(
          "Currently Learning & Exploring",
          style: AppTextStyles.sectionTitle(
            isMobile: true,
          ).copyWith(fontSize: 18),
        ).animate().fade(delay: 450.ms),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
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

  Widget _buildStatContainer(
    double width,
    String val,
    String label,
    Color accentColor,
  ) {
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
            style: AppTextStyles.heroName(
              context,
              isMobile: true,
            ).copyWith(fontSize: 32, color: accentColor),
          ),
          const SizedBox(height: 4),
          Text(label, style: AppTextStyles.bodyText(fontSize: 14)),
        ],
      ),
    );
  }
}
