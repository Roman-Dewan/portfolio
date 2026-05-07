import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:roman_portfolio/core/layout/responsive_layout.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isDesktop(context) ? 100 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Experience",
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fade().slideY(),
          const SizedBox(height: 32),
          _buildTimelineItem(
            context,
            title: "App Developer (Flutter)",
            subtitle: "EON SYSTEMS",
            date: "December 2025 - Present",
          ).animate().fade(delay: 200.ms).slideY(),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, {required String title, required String subtitle, required String date}) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.secondary,
              ),
            ),
            Container(
              width: 2,
              height: 80,
              color: theme.colorScheme.secondary.withOpacity(0.3),
            ),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(subtitle, style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.secondary)),
              const SizedBox(height: 4),
              Text(date, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}
