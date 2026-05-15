import 'package:flutter/material.dart';

class AppColors {
  // Ultra premium deep dark slate background
  static const Color background = Color(0xFF0B0F19);
  
  // Sleek glassmorphic container surface
  static const Color surface = Color(0xFF131A2A);
  
  // Brilliant Electric Cyan / Neon Teal accent
  static const Color primary = Color(0xFF00F2FE);
  
  // Vibrant Deep Pink / Magenta/Purple secondary accent
  static const Color secondary = Color(0xFF9d4edd);
  
  // Crisp typography colors
  static const Color textPrimary = Color(0xFFF3F4F6);
  static const Color textSecondary = Color(0xFF9CA3AF);
  
  // Delicate borders and divider lines
  static const Color border = Color(0xFF232D45);
  
  // Enhanced card hover color
  static const Color cardHover = Color(0xFF1B243B);

  // Stunning gradients for hero and active elements
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00F2FE), Color(0xFF4FACFE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient premiumMixGradient = LinearGradient(
    colors: [Color(0xFF00F2FE), Color(0xFF9d4edd)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
