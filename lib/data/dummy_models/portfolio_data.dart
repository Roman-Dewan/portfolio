import '../../models/project_model.dart';
import '../../models/experience_model.dart';
import '../../models/skill_model.dart';
import '../../models/achievement_model.dart';
import '../../models/certification_model.dart';
import '../../models/social_link_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortfolioData {
  // ── Personal Info ──────────────────────────────────────────────
  static const String name = 'MD. Roman Dewan';
  static const String tagline = 'App Developer (Flutter)';
  static const List<String> animatedRoles = [
    'App Developer',
    'Flutter Developer',
    'Software Developer',
  ];
  static const String summary =
      'I build beautiful, high-performance cross-platform mobile apps. Currently pursuing my B.Sc. in CSE at Uttara University and seeking a professional team to grow with.';
  static const String aboutMe =
      'I am a highly motivated and dedicated Flutter Developer currently pursuing a B.Sc. in CSE at Uttara University. Consistent in self-learning with a strong passion for developing beautiful, efficient cross-platform mobile apps. I love tackling complex problems, which drives my regular practice on platforms like LeetCode and Codeforces. Eager to contribute my skills to a professional team and continue growing as an engineer.';
  static const String email = 'roman.dewan18@gmail.com';
  static const String phone = '+8801521-738765';
  static const String location = 'Gazipur, Dhaka, Bangladesh';
  static const String profileImagePath =
      'assets/images/roman-professional.webp';
  static const String resumeUrl = 'https://linkedin.com/';
  static const int leetcodeCount = 120; // example problems solved
  static const int codeforcesCount = 85; // example problems solved

  // ── Social Links ────────────────────────────────────────────────
  static final List<SocialLinkModel> socialLinks = [
    const SocialLinkModel(
      label: 'GitHub',
      url: 'https://github.com/Roman-Dewan',
      icon: FontAwesomeIcons.github,
    ),
    const SocialLinkModel(
      label: 'LinkedIn',
      url: 'https://www.linkedin.com/in/md-roman-dewan-462a042b6/',
      icon: FontAwesomeIcons.linkedin,
    ),
    const SocialLinkModel(
      label: 'Email',
      url: 'mailto:roman.dewan18@gmail.com',
      icon: FontAwesomeIcons.envelope,
    ),
  ];

  // ── Skills ──────────────────────────────────────────────────────
  static final List<SkillModel> skills = [
    const SkillModel(
      category: 'Languages',
      skills: [
        'Dart',
        'C',
        'C++',
        'C#',
        'Java',
        'Python',
        'SQL',
        'HTML5',
        'CSS3',
      ],
    ),
    const SkillModel(
      category: 'Frameworks & Tech',
      skills: ['Flutter', 'Provider', 'REST APIs', 'Git', 'Cross-Platform Dev'],
    ),
    const SkillModel(
      category: 'Core Knowledge',
      skills: [
        'Data Structures',
        'Algorithms',
        'Object-Oriented Programming',
        'UI/UX Implementation',
      ],
    ),
  ];

  // ── Projects ────────────────────────────────────────────────────
  static final List<ProjectModel> projects = [
    const ProjectModel(
      title: 'Blood Donation App',
      description:
          'Fully completed. Connected donors and recipients based on blood type/location. Features full UI/UX, API service architecture, and user authentication.',
      techStack: ['Flutter', 'Dart', 'REST API'],
      githubUrl: 'https://github.com/',
      liveUrl: null,
    ),
    const ProjectModel(
      title: 'E-learning Platform',
      description:
          'Cross-platform (App & Web) learning solution featuring modern design and dynamic responsive layout.',
      techStack: ['Flutter', 'Provider'],
      githubUrl: 'https://github.com/',
      liveUrl: null,
    ),
    const ProjectModel(
      title: 'E-commerce App',
      description:
          'Modern shopping experience with seamless navigation, state management, and elegant cart flows.',
      techStack: ['Flutter', 'Dart'],
      githubUrl: 'https://github.com/',
      liveUrl: null,
    ),
    const ProjectModel(
      title: 'Task Manager App',
      description:
          'Complete productivity app with Provider state management, RESTful APIs, local caching, and full CRUD functionality.',
      techStack: ['Flutter', 'Provider', 'Local Storage'],
      githubUrl: 'https://github.com/',
      liveUrl: null,
    ),
    const ProjectModel(
      title: 'Pet Mates Website',
      description:
          'Dynamic frontend pet adoption platform structured using standard semantic interfaces.',
      techStack: ['HTML5', 'CSS3', 'JavaScript'],
      githubUrl: 'https://github.com/',
      liveUrl: null,
    ),
  ];

  // ── Experience ──────────────────────────────────────────────────
  static final List<ExperienceModel> experiences = [
    const ExperienceModel(
      role: 'App Developer (Flutter)',
      company: 'EON SYSTEMS',
      duration: 'December 2025 – Present',
      responsibilities: [
        'Developing highly responsive and performant cross-platform mobile applications.',
        'Collaborating on UI/UX implementation and integrating complex backend REST APIs.',
      ],
      techTags: ['Flutter', 'Dart', 'API Integration'],
    ),
    const ExperienceModel(
      role: 'B.Sc. in CSE (Student)',
      company: 'Uttara University',
      duration: '2023 – Present',
      responsibilities: [
        'Focusing on foundational computing principles, data structures, algorithms, and advanced software engineering.',
      ],
      techTags: ['C', 'C++', 'Java', 'Algorithms'],
    ),
  ];

  // ── Achievements ────────────────────────────────────────────────
  static final List<AchievementModel> achievements = [
    const AchievementModel(
      year: '2025',
      title: 'Completed Full Stack Flutter Training',
      organization: 'Professional Training Track',
      description:
          'Mastered core architectural concepts, state management, and production UI polish.',
    ),
  ];

  // ── Certifications ──────────────────────────────────────────────
  static final List<CertificationModel> certifications = [
    const CertificationModel(
      year: '2024',
      title: 'Cross-Platform Mobile App Development',
      issuer: 'Online Learning Platform',
      description:
          'Comprehensive study of Dart programming language and Flutter widget architecture.',
    ),
  ];

  // ── Currently Learning ──────────────────────────────────────────
  static const List<String> currentlyLearning = [
    'Advanced State Management Architecture',
    'High-Performance CanvasKit Animations',
  ];
}
