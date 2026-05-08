import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roman_portfolio/core/layout/responsive_layout.dart';
import 'package:roman_portfolio/presentation/providers/portfolio_provider.dart';
import 'package:roman_portfolio/data/models/portfolio_models.dart';

class PricingSection extends ConsumerWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plans = ref.watch(portfolioProvider).pricingPlans;
    
    // Use a fixed height so all cards are identical in size
    const double cardHeight = 650.0;

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
              children: plans.map((plan) => Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: SizedBox(
                  width: double.infinity,
                  height: cardHeight,
                  child: _PricingCard(plan: plan),
                ),
              )).toList(),
            ),
            tablet: Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: plans.map((plan) => SizedBox(
                width: 320,
                height: cardHeight,
                child: _PricingCard(plan: plan),
              )).toList(),
            ),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: plans.map((plan) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: 320,
                    height: cardHeight,
                    child: _PricingCard(plan: plan),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PricingCard extends StatelessWidget {
  final PricingPlan plan;

  const _PricingCard({required this.plan});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = theme.brightness == Brightness.dark
        ? const Color(0xFF1C1C1E)
        : Colors.white;

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
        border: plan.isPopular
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
          if (plan.isPopular)
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
          if (!plan.isPopular) const SizedBox(height: 38), // placeholder to balance the 'Most Popular' tag
          Text(plan.title, style: theme.textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(plan.description, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 24),
          Text(
            plan.price,
            style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: plan.features.map((f) => Padding(
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
                    )).toList(),
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: plan.isPopular ? theme.colorScheme.secondary : null,
                foregroundColor: plan.isPopular ? Colors.white : null,
              ),
              child: const Text("Get Started"),
            ),
          )
        ],
      ),
    );
  }
}
