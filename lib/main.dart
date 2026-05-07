import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roman_portfolio/core/theme/app_theme.dart';
import 'package:roman_portfolio/di/injection.dart';
import 'package:roman_portfolio/presentation/pages/portfolio_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roman Dewan - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Support both light and dark modes
      home: const PortfolioPage(),
    );
  }
}
