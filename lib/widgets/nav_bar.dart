import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../data/dummy/portfolio_data.dart';
import '../providers/portfolio_provider.dart';

class NavBar extends StatelessWidget {
  final ScrollToId scrollToId;

  const NavBar({
    super.key,
    required this.scrollToId,
  });

  static const List<Map<String, String>> navItems = [
    {'label': 'Home', 'id': 'home'},
    {'label': 'About', 'id': 'about'},
    {'label': 'Skills', 'id': 'skills'},
    {'label': 'Projects', 'id': 'projects'},
    {'label': 'Experience', 'id': 'experience'},
    {'label': 'Achievements', 'id': 'achievements'},
    {'label': 'Contact', 'id': 'contact'},
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 1024;
    final provider = context.watch<PortfolioProvider>();

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48),
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: 0.75),
            border: Border(bottom: BorderSide(color: AppColors.border.withValues(alpha: 0.5))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    provider.setNavIndex(0);
                    scrollToId.animateTo('home', duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColors.primaryGradient,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.4),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Text(
                          "R",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        PortfolioData.name.split(' ').last,
                        style: AppTextStyles.sectionTitle(isMobile: true).copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              if (isMobile)
                IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.textPrimary),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                )
              else
                Row(
                  children: [
                    ...List.generate(navItems.length, (index) {
                      final item = navItems[index];
                      final bool isActive = provider.selectedNavIndex == index;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: _NavItem(
                          label: item['label']!,
                          isActive: isActive,
                          onTap: () {
                            provider.setNavIndex(index);
                            scrollToId.animateTo(item['id']!, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                          },
                        ),
                      );
                    }),
                    const SizedBox(width: 16),
                    Container(
                      height: 24,
                      width: 1,
                      color: AppColors.border,
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: Icon(
                        provider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      onPressed: provider.toggleTheme,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: widget.isActive
                ? AppColors.primary.withValues(alpha: 0.1)
                : (_isHovered ? AppColors.surface : Colors.transparent),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.isActive
                  ? AppColors.primary.withValues(alpha: 0.3)
                  : Colors.transparent,
            ),
          ),
          child: Text(
            widget.label,
            style: AppTextStyles.monospace(
              fontSize: 14,
              color: widget.isActive
                  ? AppColors.primary
                  : (_isHovered ? AppColors.textPrimary : AppColors.textSecondary),
            ).copyWith(fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
