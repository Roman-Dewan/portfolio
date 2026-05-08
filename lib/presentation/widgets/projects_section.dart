import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roman_portfolio/core/layout/responsive_layout.dart';
import 'package:roman_portfolio/presentation/providers/portfolio_provider.dart';
import 'package:roman_portfolio/data/models/portfolio_models.dart';

class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(portfolioProvider).projects;

    // Fixed height ensures every project card is identical in height
    const double cardHeight = 360.0;

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
            "Projects",
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fade().slideY(),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 1024;
              final isTablet = constraints.maxWidth >= 768 && constraints.maxWidth <= 1024;
              
              double cardWidth = constraints.maxWidth;
              if (isDesktop) {
                cardWidth = (constraints.maxWidth - 48) / 3; // 3 items per row
              } else if (isTablet) {
                cardWidth = (constraints.maxWidth - 24) / 2; // 2 items per row
              }

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: projects.map((p) => SizedBox(
                  width: cardWidth,
                  height: cardHeight,
                  child: _buildProjectCard(context, p),
                )).toList(),
              );
            }
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, ProjectItem project) {
    final theme = Theme.of(context);
    final cardColor = theme.brightness == Brightness.dark ? const Color(0xFF1C1C1E) : Colors.white;

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.brightness == Brightness.dark ? Colors.white12 : Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title, 
            style: theme.textTheme.headlineMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Text(project.description, style: theme.textTheme.bodyMedium?.copyWith(height: 1.5)),
            ),
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
              child: const Text("View Project"),
            ),
          )
        ],
      ),
    ).animate().fade(delay: 300.ms).slideY();
  }
}
