import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../models/project_model.dart';
import 'skill_chip.dart';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0.0, _isHovered ? -10.0 : 0.0, 0.0),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.cardHover : AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isHovered ? AppColors.primary.withValues(alpha: 0.6) : AppColors.border,
            width: 1.5,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 30,
                    spreadRadius: 2,
                    offset: const Offset(0, 12),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Stack(
            children: [
              // Inner Glass Highlight Ambient Top Glow
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 120,
                child: AnimatedOpacity(
                  opacity: _isHovered ? 0.08 : 0.02,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        colors: [AppColors.primary, Colors.transparent],
                        radius: 1.5,
                        center: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: AppColors.primary.withValues(alpha: 0.25),
                            ),
                          ),
                          child: const FaIcon(
                            FontAwesomeIcons.folderOpen,
                            size: 24,
                            color: AppColors.primary,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => _launchUrl(widget.project.githubUrl),
                              icon: const FaIcon(FontAwesomeIcons.github, size: 20),
                              color: AppColors.textSecondary,
                              hoverColor: AppColors.primary,
                              tooltip: "View Source",
                            ),
                            if (widget.project.liveUrl != null)
                              IconButton(
                                onPressed: () => _launchUrl(widget.project.liveUrl!),
                                icon: const FaIcon(FontAwesomeIcons.upRightFromSquare, size: 18),
                                color: AppColors.textSecondary,
                                hoverColor: AppColors.primary,
                                tooltip: "Live Demo",
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.project.title,
                      style: AppTextStyles.sectionTitle(isMobile: true).copyWith(
                        fontSize: 22,
                        color: _isHovered ? AppColors.primary : AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Text(
                          widget.project.description,
                          style: AppTextStyles.bodyText(fontSize: 14),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.techStack
                          .map((tech) => SkillChip(
                                label: tech,
                                fontSize: 11,
                                color: AppColors.secondary,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
