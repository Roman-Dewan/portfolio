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

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MD. Roman Dewan'),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: false,
        actions: [
          TextButton(onPressed: () {}, child: const Text('About')),
          TextButton(onPressed: () {}, child: const Text('Skills')),
          TextButton(onPressed: () {}, child: const Text('Experience')),
          TextButton(onPressed: () {}, child: const Text('Services')),
          TextButton(onPressed: () {}, child: const Text('Pricing')),
          TextButton(onPressed: () {}, child: const Text('Projects')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Contact Me'),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: const [
                HomeSection(),
                Divider(height: 1),
                AboutSection(),
                Divider(height: 1),
                SkillsSection(),
                Divider(height: 1),
                EducationSection(),
                Divider(height: 1),
                ExperienceSection(),
                Divider(height: 1),
                ServiceSection(),
                Divider(height: 1),
                PricingSection(),
                Divider(height: 1),
                ProjectsSection(),
                Divider(height: 1),
                ContactSection(),
                SizedBox(height: 80),
              ],
            ),
          )
        ],
      ),
    );
  }
}
