import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/constants/app_strings.dart';
import '../../../providers/portfolio_provider.dart';
import '../../../widgets/achievement_card.dart';
import '../../../widgets/section_title.dart';

class AchievementsSection extends StatefulWidget {
  const AchievementsSection({super.key});

  @override
  State<AchievementsSection> createState() => _AchievementsSectionState();
}

class _AchievementsSectionState extends State<AchievementsSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final achievements = context.select((PortfolioProvider p) => p.achievements);
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return VisibilityDetector(
      key: const Key('achievements-section'),
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
              title: AppStrings.achievements,
              subtitle: "Competitive programming ranks, official hackathons, and global distinctions.",
            ),
            const SizedBox(height: 56),
            if (_isVisible)
              LayoutBuilder(
                builder: (context, constraints) {
                  final double gap = 24.0;
                  int columns = 2;
                  if (constraints.maxWidth < 700) {
                    columns = 1;
                  }
                  final double itemWidth = (constraints.maxWidth - (gap * (columns - 1))) / columns;

                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: List.generate(achievements.length, (index) {
                      return SizedBox(
                        width: itemWidth,
                        child: IntrinsicHeight(
                          child: AchievementCard(achievement: achievements[index]),
                        ),
                      ).animate().fade(delay: (index * 100).ms, duration: 600.ms).slideY(begin: 0.15, end: 0);
                    }),
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
