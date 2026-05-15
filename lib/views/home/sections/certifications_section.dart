import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/constants/app_strings.dart';
import '../../../providers/portfolio_provider.dart';
import '../../../widgets/certification_card.dart';
import '../../../widgets/section_title.dart';

class CertificationsSection extends StatefulWidget {
  const CertificationsSection({super.key});

  @override
  State<CertificationsSection> createState() => _CertificationsSectionState();
}

class _CertificationsSectionState extends State<CertificationsSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final certifications = context.select((PortfolioProvider p) => p.certifications);
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return VisibilityDetector(
      key: const Key('certifications-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 24 : 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: AppStrings.certifications,
              subtitle: "Verified official credentials, enterprise cloud certifications, and technical mastery.",
            ),
            const SizedBox(height: 56),
            if (_isVisible)
              LayoutBuilder(
                builder: (context, constraints) {
                  final double gap = 24.0;
                  int columns = 2;
                  if (constraints.maxWidth < 700) {
                    columns = 1;
                  }
                  final double itemWidth = (constraints.maxWidth - (gap * (columns - 1))) / columns;

                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: List.generate(certifications.length, (index) {
                      return SizedBox(
                        width: itemWidth,
                        child: IntrinsicHeight(
                          child: CertificationCard(certification: certifications[index]),
                        ),
                      ).animate().fade(delay: (index * 100).ms, duration: 600.ms).slideY(begin: 0.15, end: 0);
                    }),
                  );
                },
              )
            else
              const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
