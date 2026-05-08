import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roman_portfolio/core/layout/responsive_layout.dart';
import 'package:roman_portfolio/presentation/providers/portfolio_provider.dart';
import 'package:roman_portfolio/data/models/portfolio_models.dart';

class ServiceSection extends ConsumerWidget {
  const ServiceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(portfolioProvider).services;

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
              children: services
                  .map(
                    (s) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _buildServiceCard(context, s),
                    ),
                  )
                  .toList(),
            ),
            tablet: Column(
              children: services
                  .map(
                    (s) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _buildServiceCard(context, s),
                    ),
                  )
                  .toList(),
            ),
            desktop: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: services.asMap().entries.map((entry) {
                  final isLast = entry.key == services.length - 1;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: isLast ? 0 : 24),
                      child: _buildServiceCard(context, entry.value),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'phone_android':
        return Icons.phone_android;
      case 'design_services':
        return Icons.design_services;
      case 'api':
        return Icons.api;
      default:
        return Icons.design_services;
    }
  }

  Widget _buildServiceCard(BuildContext context, ServiceItem service) {
    final theme = Theme.of(context);
    final cardColor = theme.brightness == Brightness.dark
        ? const Color(0xFF1C1C1E)
        : Colors.white;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: theme.brightness == Brightness.dark
              ? Colors.white12
              : Colors.black12,
        ),
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
          Icon(
            _getIconData(service.iconName),
            size: 48,
            color: theme.colorScheme.secondary,
          ),
          const SizedBox(height: 24),
          Text(service.title, style: theme.textTheme.headlineMedium),
        ],
      ),
    ).animate().fade(delay: 300.ms).scale();
  }
}
