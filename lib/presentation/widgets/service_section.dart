import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:roman_portfolio/core/layout/responsive_layout.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {"title": "Cross-Platform App Development", "icon": Icons.phone_android},
      {"title": "UI/UX Implementation", "icon": Icons.design_services},
      {"title": "API Integration", "icon": Icons.api},
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
            "Services",
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fade().slideY(),
          const SizedBox(height: 32),
          ResponsiveLayout(
            mobile: Column(
              children: services.map((s) => _buildServiceCard(context, s)).toList(),
            ),
            desktop: Row(
              children: services.map((s) => Expanded(child: _buildServiceCard(context, s))).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service) {
    final theme = Theme.of(context);
    final cardColor = theme.brightness == Brightness.dark ? const Color(0xFF1C1C1E) : Colors.white;
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      margin: EdgeInsets.only(bottom: isDesktop ? 0 : 24, right: isDesktop ? 24 : 0),
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
          Icon(service["icon"], size: 48, color: theme.colorScheme.secondary),
          const SizedBox(height: 24),
          Text(service["title"], style: theme.textTheme.headlineMedium),
        ],
      ),
    ).animate().fade(delay: 300.ms).scale();
  }
}
