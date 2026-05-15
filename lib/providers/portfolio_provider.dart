import 'package:flutter/foundation.dart';
import '../data/dummy_models/portfolio_data.dart';
import '../models/project_model.dart';
import '../models/experience_model.dart';
import '../models/skill_model.dart';
import '../models/achievement_model.dart';
import '../models/certification_model.dart';

class PortfolioProvider extends ChangeNotifier {
  // Navigation
  int _selectedNavIndex = 0;
  int get selectedNavIndex => _selectedNavIndex;

  void setNavIndex(int index) {
    _selectedNavIndex = index;
    notifyListeners();
  }

  // Dark/Light Theme toggle
  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  // Expose data from dummy data
  List<ProjectModel> get projects => PortfolioData.projects;
  List<ExperienceModel> get experiences => PortfolioData.experiences;
  List<SkillModel> get skills => PortfolioData.skills;
  List<AchievementModel> get achievements => PortfolioData.achievements;
  List<CertificationModel> get certifications => PortfolioData.certifications;
}
