import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/constants/app_strings.dart';
import '../../../providers/portfolio_provider.dart';
import '../../../widgets/project_card.dart';
import '../../../widgets/section_title.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final projects = context.select((PortfolioProvider p) => p.projects);
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return VisibilityDetector(
      key: const Key('projects-section'),
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
              title: AppStrings.myProjects,
              subtitle: "A showcase of custom applications, structural architectures, and full stack implementations.",
            ),
            const SizedBox(height: 56),
            if (_isVisible)
              LayoutBuilder(
                builder: (context, constraints) {
                  final double gap = 24.0;
                  int columns = 3;
                  if (constraints.maxWidth < 700) {
                    columns = 1;
                  } else if (constraints.maxWidth < 1100) {
                    columns = 2;
                  }
                  final double itemWidth = (constraints.maxWidth - (gap * (columns - 1))) / columns;

                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: List.generate(projects.length, (index) {
                      return SizedBox(
                        width: itemWidth,
                        child: IntrinsicHeight(
                          child: ProjectCard(project: projects[index]),
                        ),
                      ).animate().fade(delay: (index * 100).ms, duration: 600.ms).slideY(begin: 0.15, end: 0);
                    }),
                  );
                },
              )
            else
              const SizedBox(height: 300),
          ],
        ),
      ),
    );
  }
}
