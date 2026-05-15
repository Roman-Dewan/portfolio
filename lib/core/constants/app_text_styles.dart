import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle heroName(BuildContext context, {bool isMobile = false}) {
    return GoogleFonts.outfit(
      fontSize: isMobile ? 36 : 64,
      fontWeight: FontWeight.w900,
      letterSpacing: -1.0,
      color: AppColors.textPrimary,
      height: 1.1,
    );
  }

  static TextStyle sectionTitle({bool isMobile = false}) {
    return GoogleFonts.outfit(
      fontSize: isMobile ? 28 : 40,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
      color: AppColors.textPrimary,
    );
  }

  static TextStyle bodyText({double fontSize = 16, Color color = AppColors.textSecondary}) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      color: color,
      height: 1.7,
      letterSpacing: 0.2,
    );
  }

  static TextStyle monospace({double fontSize = 14, FontWeight fontWeight = FontWeight.normal, Color color = AppColors.primary}) {
    return GoogleFonts.firaCode(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: -0.3,
    );
  }
}
