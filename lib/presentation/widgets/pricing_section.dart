import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:roman_portfolio/core/layout/responsive_layout.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isDesktop(context) ? 100 : 24,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            "Pricing",
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fade().slideY(),
          const SizedBox(height: 16),
          Text(
            "Transparent pricing for premium solutions.",
            style: Theme.of(context).textTheme.bodyLarge,
          ).animate().fade(delay: 200.ms).slideY(),
          const SizedBox(height: 64),
          ResponsiveLayout(
            mobile: Column(
              children: _buildPricingCards(context),
            ),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _buildPricingCards(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPricingCards(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);
    return [
      _PricingCard(
        title: "Basic App",
        price: "Contact",
        description: "Perfect for simple MVP apps.",
        features: const [
          "Single Platform (Android/iOS)",
          "Basic UI/UX Design",
          "No API Integration",
          "1 Month Support"
        ],
      ).animate().fade(delay: 400.ms).slideY(),
      SizedBox(height: isDesktop ? 0 : 32, width: isDesktop ? 32 : 0),
      _PricingCard(
        title: "Standard App",
        price: "Contact",
        description: "Great for most standard apps.",
        isPopular: true,
        features: const [
          "Cross Platform (Android & iOS)",
          "Premium Custom UI/UX",
          "REST API Integration",
          "State Management",
          "3 Months Support"
        ],
      ).animate().fade(delay: 500.ms).scale(),
      SizedBox(height: isDesktop ? 0 : 32, width: isDesktop ? 32 : 0),
      _PricingCard(
        title: "Enterprise Solution",
        price: "Contact",
        description: "For complex, scalable needs.",
        features: const [
          "Web, Android & iOS",
          "Advanced Animations & Polish",
          "Complex API/Backend Auth",
          "Advanced Local Caching",
          "6 Months Support"
        ],
      ).animate().fade(delay: 600.ms).slideY(),
    ];
  }
}

class _PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final List<String> features;
  final bool isPopular;

  const _PricingCard({
    required this.title,
    required this.price,
    required this.description,
    required this.features,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = theme.brightness == Brightness.dark
        ? const Color(0xFF1C1C1E)
        : Colors.white;

    return Container(
      width: ResponsiveLayout.isDesktop(context) ? 320 : double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: isPopular
            ? Border.all(color: theme.colorScheme.secondary, width: 2)
            : Border.all(color: theme.brightness == Brightness.dark ? Colors.white12 : Colors.black12, width: 1),
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
          if (isPopular)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Most Popular",
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Text(title, style: theme.textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(description, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 24),
          Text(
            price,
            style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          ...features.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle_rounded,
                        color: theme.colorScheme.secondary, size: 20),
                    const SizedBox(width: 12),
                    Expanded(child: Text(f, style: theme.textTheme.bodyMedium)),
                  ],
                ),
              )),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isPopular ? theme.colorScheme.secondary : null,
                foregroundColor: isPopular ? Colors.white : null,
              ),
              child: const Text("Get Started"),
            ),
          )
        ],
      ),
    );
  }
}
