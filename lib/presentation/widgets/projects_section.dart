import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:roman_portfolio/core/layout/responsive_layout.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        "title": "Blood Donation App",
        "description": "Fully completed. Connected donors and recipients based on blood type/location. Features full UI/UX, API service architecture, and user authentication."
      },
      {
        "title": "E-learning Platform",
        "description": "Cross-platform (App & Web) learning solution."
      },
      {
        "title": "E-commerce App",
        "description": "Modern shopping experience with seamless navigation."
      },
      {
        "title": "Task Manager App",
        "description": "Complete productivity app with Provider state management, RESTful APIs, local caching, and full CRUD functionality."
      },
      {
        "title": "Pet Mates Website",
        "description": "Dynamic frontend pet adoption platform using HTML/CSS/JS."
      },
    ];

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
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: projects.map((p) => _buildProjectCard(context, p)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Map<String, String> project) {
    final theme = Theme.of(context);
    final cardColor = theme.brightness == Brightness.dark ? const Color(0xFF1C1C1E) : Colors.white;
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      width: isDesktop ? 400 : double.infinity,
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
          Text(project["title"]!, style: theme.textTheme.headlineMedium),
          const SizedBox(height: 16),
          Text(project["description"]!, style: theme.textTheme.bodyMedium?.copyWith(height: 1.5)),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero, alignment: Alignment.centerLeft),
            child: const Text("View Project"),
          )
        ],
      ),
    ).animate().fade(delay: 300.ms).slideY();
  }
}
