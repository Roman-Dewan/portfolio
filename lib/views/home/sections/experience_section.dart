import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../providers/portfolio_provider.dart';
import '../../../widgets/experience_card.dart';
import '../../../widgets/section_title.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final experiences = context.select((PortfolioProvider p) => p.experiences);
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return VisibilityDetector(
      key: const Key('experience-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 24 : 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: AppStrings.experience,
              subtitle: "Professional trajectory, leadership milestones, and primary contributions.",
            ),
            const SizedBox(height: 56),
            if (_isVisible)
              Stack(
                children: [
                  // Continuous Left Timeline Line
                  Positioned(
                    left: 23,
                    top: 24,
                    bottom: 24,
                    width: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.secondary, AppColors.border],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(experiences.length, (index) {
                      final exp = experiences[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Beautiful glowing node
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.background,
                                border: Border.all(color: AppColors.primary, width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withValues(alpha: 0.4),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(
                              child: ExperienceCard(experience: exp)
                                  .animate()
                                  .fade(delay: (index * 150).ms, duration: 600.ms)
                                  .slideX(begin: 0.1, end: 0),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              )
            else
              const SizedBox(height: 300),
          ],
        ),
      ),
    );
  }
}
