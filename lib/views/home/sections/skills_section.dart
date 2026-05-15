import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../providers/portfolio_provider.dart';
import '../../../widgets/section_title.dart';
import '../../../widgets/skill_chip.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final skills = context.select((PortfolioProvider p) => p.skills);
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return VisibilityDetector(
      key: const Key('skills-section'),
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
              title: AppStrings.mySkills,
              subtitle: "Categorized competencies spanning languages, cross-platform frameworks, and robust tools.",
            ),
            const SizedBox(height: 56),
            if (_isVisible)
              LayoutBuilder(
                builder: (context, constraints) {
                  final double gap = 24.0;
                  final int columns = constraints.maxWidth > 800 ? 2 : 1;
                  final double itemWidth = (constraints.maxWidth - (gap * (columns - 1))) / columns;

                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: skills.map((skillGroup) {
                      final int groupIndex = skills.indexOf(skillGroup);
                      final accentColor = groupIndex.isEven ? AppColors.primary : AppColors.secondary;

                      return SizedBox(
                        width: itemWidth,
                        child: Container(
                          padding: const EdgeInsets.all(28),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.border),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.category, size: 18, color: accentColor),
                                  const SizedBox(width: 10),
                                  Text(
                                    skillGroup.category,
                                    style: AppTextStyles.sectionTitle(isMobile: true).copyWith(
                                      fontSize: 18,
                                      color: accentColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: skillGroup.skills.map((skill) {
                                  final int skillIndex = skillGroup.skills.indexOf(skill);
                                  return SkillChip(
                                    label: skill,
                                    fontSize: 13,
                                    color: accentColor,
                                  ).animate().fade(delay: (groupIndex * 100 + skillIndex * 40).ms, duration: 400.ms).scale();
                                }).toList(),
                              ),
                            ],
                          ),
                        ).animate().fade(delay: (groupIndex * 150).ms, duration: 500.ms).slideY(begin: 0.1, end: 0),
                      );
                    }).toList(),
                  );
                },
              )
            else
              const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
