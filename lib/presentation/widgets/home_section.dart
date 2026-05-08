import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roman_portfolio/core/layout/responsive_layout.dart';
import 'package:roman_portfolio/presentation/providers/portfolio_provider.dart';

class HomeSection extends ConsumerWidget {
  final VoidCallback onViewProjectsPressed;
  final VoidCallback onHireMePressed;

  const HomeSection({
    super.key,
    required this.onViewProjectsPressed,
    required this.onHireMePressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioData = ref.watch(portfolioProvider);
    final profile = portfolioData.profileInfo;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isDesktop(context) ? 100 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hello, I'm ${profile.name}",
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ).animate().fade(duration: 600.ms).slideY(begin: 0.3, end: 0),
          const SizedBox(height: 24),
          Text(
            profile.role,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
            textAlign: TextAlign.center,
          ).animate().fade(duration: 600.ms, delay: 200.ms).slideY(begin: 0.3, end: 0),
          const SizedBox(height: 24),
          Text(
            "Based in ${profile.location}\nCrafting beautiful, efficient cross-platform mobile experiences.",
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ).animate().fade(duration: 600.ms, delay: 400.ms).slideY(begin: 0.3, end: 0),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onViewProjectsPressed,
                child: const Text("View Projects"),
              ).animate().fade(duration: 600.ms, delay: 600.ms).scale(),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: onHireMePressed,
                child: const Text("Hire Me"),
              ).animate().fade(duration: 600.ms, delay: 700.ms).scale(),
            ],
          )
        ],
      ),
    );
  }
}
