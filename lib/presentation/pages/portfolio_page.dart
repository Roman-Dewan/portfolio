import 'package:flutter/material.dart';
import 'package:roman_portfolio/presentation/widgets/home_section.dart';
import 'package:roman_portfolio/presentation/widgets/about_section.dart';
import 'package:roman_portfolio/presentation/widgets/skills_section.dart';
import 'package:roman_portfolio/presentation/widgets/education_section.dart';
import 'package:roman_portfolio/presentation/widgets/experience_section.dart';
import 'package:roman_portfolio/presentation/widgets/service_section.dart';
import 'package:roman_portfolio/presentation/widgets/pricing_section.dart';
import 'package:roman_portfolio/presentation/widgets/projects_section.dart';
import 'package:roman_portfolio/presentation/widgets/contact_section.dart';
import 'package:roman_portfolio/core/layout/responsive_layout.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _pricingKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    final isTablet = ResponsiveLayout.isTablet(context);
    final showFullMenu = isDesktop || isTablet;

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => _scrollTo(_homeKey),
          child: const Text('MD. Roman Dewan'),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        actions: showFullMenu
            ? [
                TextButton(
                  onPressed: () => _scrollTo(_aboutKey),
                  child: const Text('About'),
                ),
                TextButton(
                  onPressed: () => _scrollTo(_skillsKey),
                  child: const Text('Skills'),
                ),
                TextButton(
                  onPressed: () => _scrollTo(_experienceKey),
                  child: const Text('Experience'),
                ),
                TextButton(
                  onPressed: () => _scrollTo(_servicesKey),
                  child: const Text('Services'),
                ),
                TextButton(
                  onPressed: () => _scrollTo(_pricingKey),
                  child: const Text('Pricing'),
                ),
                TextButton(
                  onPressed: () => _scrollTo(_projectsKey),
                  child: const Text('Projects'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () => _scrollTo(_contactKey),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Contact Me'),
                  ),
                ),
              ]
            : [
                PopupMenuButton<GlobalKey>(
                  icon: const Icon(Icons.menu),
                  onSelected: (key) => _scrollTo(key),
                  itemBuilder: (context) => [
                    PopupMenuItem(value: _aboutKey, child: const Text('About')),
                    PopupMenuItem(value: _skillsKey, child: const Text('Skills')),
                    PopupMenuItem(value: _experienceKey, child: const Text('Experience')),
                    PopupMenuItem(value: _servicesKey, child: const Text('Services')),
                    PopupMenuItem(value: _pricingKey, child: const Text('Pricing')),
                    PopupMenuItem(value: _projectsKey, child: const Text('Projects')),
                    PopupMenuItem(value: _contactKey, child: const Text('Contact Me')),
                  ],
                ),
              ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                HomeSection(
                  key: _homeKey,
                  onViewProjectsPressed: () => _scrollTo(_projectsKey),
                  onHireMePressed: () => _scrollTo(_contactKey),
                ),
                const Divider(height: 1),
                AboutSection(key: _aboutKey),
                const Divider(height: 1),
                SkillsSection(key: _skillsKey),
                const Divider(height: 1),
                const EducationSection(),
                const Divider(height: 1),
                ExperienceSection(key: _experienceKey),
                const Divider(height: 1),
                ServiceSection(key: _servicesKey),
                const Divider(height: 1),
                PricingSection(key: _pricingKey),
                const Divider(height: 1),
                ProjectsSection(key: _projectsKey),
                const Divider(height: 1),
                ContactSection(key: _contactKey),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
