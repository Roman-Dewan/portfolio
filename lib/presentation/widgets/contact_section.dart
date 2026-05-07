import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roman_portfolio/core/layout/responsive_layout.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
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
            "Contact",
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fade().slideY(),
          const SizedBox(height: 32),
          ResponsiveLayout(
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildContactInfo(context),
                const SizedBox(height: 48),
                _buildContactForm(context),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildContactInfo(context)),
                const SizedBox(width: 80),
                Expanded(flex: 2, child: _buildContactForm(context)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Get in Touch", style: theme.textTheme.headlineMedium),
        const SizedBox(height: 24),
        _contactItem(context, Icons.email, "roman.dewan18@gmail.com", () => _launchUrl("mailto:roman.dewan18@gmail.com")),
        const SizedBox(height: 16),
        _contactItem(context, Icons.phone, "+8801521-738765", () => _launchUrl("tel:+8801521738765")),
        const SizedBox(height: 32),
        Row(
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              onPressed: () => _launchUrl("https://linkedin.com/"), // Replace with actual link
              color: theme.colorScheme.secondary,
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.github),
              onPressed: () => _launchUrl("https://github.com/"), // Replace with actual link
              color: theme.colorScheme.secondary,
            ),
          ],
        )
      ],
    ).animate().fade(delay: 200.ms).slideX(begin: -0.2);
  }

  Widget _contactItem(BuildContext context, IconData icon, String text, VoidCallback onTap) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.secondary),
          const SizedBox(width: 16),
          Text(text, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: "Name",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: theme.brightness == Brightness.dark ? const Color(0xFF1C1C1E) : Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: theme.brightness == Brightness.dark ? const Color(0xFF1C1C1E) : Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          maxLines: 5,
          decoration: InputDecoration(
            labelText: "Message",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: theme.brightness == Brightness.dark ? const Color(0xFF1C1C1E) : Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Send Message"),
        )
      ],
    ).animate().fade(delay: 400.ms).slideX(begin: 0.2);
  }
}
