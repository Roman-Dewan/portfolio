import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/dummy_models/portfolio_data.dart';
import '../../../widgets/animated_text_widget.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/social_link_button.dart';

class HeroSection extends StatelessWidget {
  final ScrollToId scrollToId;

  const HeroSection({super.key, required this.scrollToId});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isDesktop = size.width >= 1024;
    final bool isMobile = size.width < 600;

    return Container(
      constraints: BoxConstraints(minHeight: size.height - 80),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 48,
        vertical: 64,
      ),
      alignment: Alignment.center,
      child: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 12,
                  child: _buildLeftContent(context, isMobile: false),
                ),
                const SizedBox(width: 64),
                Expanded(flex: 9, child: _buildRightContent(context)),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRightContent(context),
                const SizedBox(height: 56),
                _buildLeftContent(context, isMobile: true),
              ],
            ),
    );
  }

  Widget _buildLeftContent(BuildContext context, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
          ),
          child: Text(
            AppStrings.heroGreeting,
            style: AppTextStyles.monospace(
              fontSize: 13,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ).animate().fade(duration: 500.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 20),
        ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.primaryGradient.createShader(bounds),
              child: Text(
                PortfolioData.name,
                style: AppTextStyles.heroName(
                  context,
                  isMobile: isMobile,
                ).copyWith(color: Colors.white),
                textAlign: isMobile ? TextAlign.center : TextAlign.left,
              ),
            )
            .animate()
            .fade(delay: 200.ms, duration: 600.ms)
            .slideY(begin: 0.2, end: 0),
        const SizedBox(height: 12),
        AnimatedTextWidget(
          texts: PortfolioData.animatedRoles,
        ).animate().fade(delay: 400.ms, duration: 600.ms),
        const SizedBox(height: 24),
        Text(
          PortfolioData.summary,
          style: AppTextStyles.bodyText(fontSize: isMobile ? 15 : 18),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ).animate().fade(delay: 600.ms, duration: 600.ms),
        const SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            CustomButton(
              label: AppStrings.viewMyWork,
              onTap: () => scrollToId.animateTo(
                'projects',
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
            ),
            CustomButton(
              label: AppStrings.contactMe,
              onTap: () => scrollToId.animateTo(
                'contact',
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              isOutlined: true,
            ),
          ],
        ).animate().fade(delay: 800.ms, duration: 600.ms),
        const SizedBox(height: 40),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: PortfolioData.socialLinks
              .map((link) => SocialLinkButton(link: link))
              .toList(),
        ).animate().fade(delay: 1000.ms, duration: 600.ms),
      ],
    );
  }

  Widget _buildRightContent(BuildContext context) {
    return Stack(
          alignment: Alignment.center,
          children: [
            // Ambient background glow layer
            Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.25),
                    AppColors.secondary.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Main profile hero frame
            Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.premiumMixGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 40,
                    spreadRadius: 4,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(3),
              child: ClipOval(
                child: Image.asset(
                  PortfolioData.profileImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Floating premium badge
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: AppColors.primary, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      "Flutter Pro",
                      style: AppTextStyles.monospace(
                        fontSize: 12,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .scaleXY(
          begin: 0.96,
          end: 1.04,
          duration: 4.seconds,
          curve: Curves.easeInOutCubic,
        );
  }
}
