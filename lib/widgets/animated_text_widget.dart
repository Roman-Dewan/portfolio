import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class AnimatedTextWidget extends StatelessWidget {
  final List<String> texts;

  const AnimatedTextWidget({
    super.key,
    required this.texts,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    return SizedBox(
      height: isMobile ? 40 : 50,
      child: DefaultTextStyle(
        style: AppTextStyles.monospace(
          fontSize: isMobile ? 20 : 28,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: texts
              .map((text) => TypewriterAnimatedText(
                    text,
                    speed: const Duration(milliseconds: 100),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
