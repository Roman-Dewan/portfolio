import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/portfolio_provider.dart';
import 'views/home/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PortfolioProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioProvider>(
      builder: (context, provider, _) {
        return MaterialApp(
          title: 'Roman Dewan — Portfolio',
          debugShowCheckedModeBanner: false,
          themeMode: provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: const Color(0xFF0A0E1A),
          ),
          theme: ThemeData.light(),
          home: const HomeScreen(),
        );
      },
    );
  }
}
