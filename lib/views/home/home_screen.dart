import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../providers/portfolio_provider.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/nav_bar.dart';
import 'sections/about_section.dart';
import 'sections/achievements_section.dart';
import 'sections/certifications_section.dart';
import 'sections/contact_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/projects_section.dart';
import 'sections/skills_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  late ScrollToId _scrollToId;

  @override
  void initState() {
    super.initState();
    _scrollToId = ScrollToId(scrollController: _scrollController);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MediaQuery.of(context).size.width < 1024
          ? _buildMobileDrawer(context)
          : null,
      body: Column(
        children: [
          NavBar(scrollToId: _scrollToId),
          Expanded(
            child: InteractiveScrollViewer(
              scrollToId: _scrollToId,
              children: [
                ScrollContent(
                  id: 'home',
                  child: HeroSection(scrollToId: _scrollToId),
                ),
                ScrollContent(id: 'about', child: AboutSection()),
                ScrollContent(id: 'skills', child: SkillsSection()),
                ScrollContent(id: 'projects', child: ProjectsSection()),
                ScrollContent(id: 'experience', child: ExperienceSection()),
                ScrollContent(id: 'achievements', child: AchievementsSection()),
                ScrollContent(
                  id: 'certifications',
                  child: CertificationsSection(),
                ),
                ScrollContent(id: 'contact', child: ContactSection()),
                ScrollContent(id: 'footer', child: const FooterWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    final provider = context.watch<PortfolioProvider>();

    return Drawer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.border)),
            ),
            child: Center(
              child: Text(
                "Navigation",
                style: AppTextStyles.monospace(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          ...NavBar.navItems.map((item) {
            final int index = NavBar.navItems.indexOf(item);
            final bool isActive = provider.selectedNavIndex == index;
            return ListTile(
              title: Text(
                item['label']!,
                style: AppTextStyles.monospace(
                  fontSize: 16,
                  color: isActive ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
              selected: isActive,
              onTap: () {
                Navigator.pop(context);
                provider.setNavIndex(index);
                _scrollToId.animateTo(
                  item['id']!,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            );
          }),
          const Spacer(),
          ListTile(
            title: Text(
              provider.isDarkMode ? "Light Mode" : "Dark Mode",
              style: AppTextStyles.monospace(
                fontSize: 16,
                color: AppColors.secondary,
              ),
            ),
            leading: Icon(
              provider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: AppColors.secondary,
            ),
            onTap: () {
              provider.toggleTheme();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
