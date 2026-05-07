import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:roman_portfolio/core/layout/responsive_layout.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
            "About Me",
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fade().slideY(),
          const SizedBox(height: 32),
          Text(
            "Highly motivated and dedicated Flutter Developer currently pursuing a B.Sc. in CSE at Uttara University. Consistent in self-learning with a strong passion for developing beautiful, efficient cross-platform mobile apps. Eager to contribute my skills to a professional team.",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
          ).animate().fade(delay: 200.ms).slideY(),
        ],
      ),
    );
  }
}
