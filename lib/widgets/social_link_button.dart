import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/social_link_model.dart';

class SocialLinkButton extends StatefulWidget {
  final SocialLinkModel link;

  const SocialLinkButton({
    super.key,
    required this.link,
  });

  @override
  State<SocialLinkButton> createState() => _SocialLinkButtonState();
}

class _SocialLinkButtonState extends State<SocialLinkButton> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(widget.link.url);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Tooltip(
        message: widget.link.label,
        child: GestureDetector(
          onTap: _launchUrl,
          child: AnimatedScale(
            scale: _isHovered ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isHovered ? AppColors.primary.withValues(alpha: 0.15) : AppColors.surface,
                shape: BoxShape.circle,
                border: Border.all(
                  color: _isHovered ? AppColors.primary : AppColors.border,
                  width: 1.5,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.4),
                          blurRadius: 12,
                          spreadRadius: 1,
                        )
                      ]
                    : [],
              ),
              child: FaIcon(
                widget.link.icon,
                size: 20,
                color: _isHovered ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
