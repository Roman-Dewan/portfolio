import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      colorScheme: const ColorScheme.light(
        primary: Colors.black,
        secondary: Color(0xFF007AFF), // Apple Blue
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).copyWith(
        displayLarge: GoogleFonts.inter(fontSize: 56, fontWeight: FontWeight.w800, color: Colors.black, letterSpacing: -1.5),
        displayMedium: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.black, letterSpacing: -1.0),
        displaySmall: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black, letterSpacing: -0.5),
        headlineMedium: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        titleLarge: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        bodyLarge: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w400, color: const Color(0xFF4A4A4A)),
        bodyMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xFF6B6B6B)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(color: Colors.black),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: const Color(0xFF000000), // Pure Black
      colorScheme: const ColorScheme.dark(
        primary: Colors.white,
        secondary: Color(0xFF0A84FF), // Apple Dark Blue
        surface: Color(0xFF1C1C1E), // Apple Dark Gray
        onSurface: Colors.white,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.inter(fontSize: 56, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.5),
        displayMedium: GoogleFonts.inter(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -1.0),
        displaySmall: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: -0.5),
        headlineMedium: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        titleLarge: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        bodyLarge: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w400, color: const Color(0xFFD1D1D6)),
        bodyMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400, color: const Color(0xFFAEAEB2)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
