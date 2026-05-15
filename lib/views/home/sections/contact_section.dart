import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/dummy_models/portfolio_data.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/section_title.dart';
import '../../../widgets/social_link_button.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  bool _isVisible = false;

  Future<void> _launchEmail() async {
    final Uri url = Uri.parse("mailto:${PortfolioData.email}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return VisibilityDetector(
      key: const Key('contact-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 24 : 48),
        alignment: Alignment.center,
        child: Column(
          children: [
            const SectionTitle(
              title: AppStrings.getInTouch,
              subtitle: "Open to technical dialogues, full-time appointments, and ambitious initiatives.",
            ),
            const SizedBox(height: 56),
            if (_isVisible)
              Container(
                constraints: const BoxConstraints(maxWidth: 800),
                padding: EdgeInsets.all(isMobile ? 32 : 56),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: AppColors.border, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      blurRadius: 40,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.handshake, size: 48, color: AppColors.primary),
                    ).animate().scale(duration: 500.ms, curve: Curves.easeOut),
                    const SizedBox(height: 24),
                    Text(
                      "Let's Build Together",
                      style: AppTextStyles.sectionTitle(isMobile: isMobile).copyWith(fontSize: 28),
                      textAlign: TextAlign.center,
                    ).animate().fade(delay: 100.ms),
                    const SizedBox(height: 16),
                    Text(
                      AppStrings.contactText,
                      style: AppTextStyles.bodyText(fontSize: 16),
                      textAlign: TextAlign.center,
                    ).animate().fade(delay: 200.ms),
                    const SizedBox(height: 36),
                    CustomButton(
                      label: "Initiate Direct Mail",
                      onTap: _launchEmail,
                    ).animate().fade(delay: 300.ms).scale(),
                    const SizedBox(height: 48),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: PortfolioData.socialLinks
                          .map((link) => SocialLinkButton(link: link))
                          .toList(),
                    ).animate().fade(delay: 400.ms),
                    const SizedBox(height: 36),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.background.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.location_on, color: AppColors.primary, size: 16),
                              const SizedBox(width: 8),
                              Text(
                                PortfolioData.location,
                                style: AppTextStyles.bodyText(fontSize: 13),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.phone, color: AppColors.secondary, size: 16),
                              const SizedBox(width: 8),
                              Text(
                                PortfolioData.phone,
                                style: AppTextStyles.bodyText(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ).animate().fade(delay: 500.ms),
                  ],
                ),
              )
            else
              const SizedBox(height: 300),
          ],
        ),
      ),
    );
  }
}
