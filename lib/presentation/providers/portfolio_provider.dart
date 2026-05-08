import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roman_portfolio/data/models/portfolio_models.dart';

final portfolioProvider = Provider<PortfolioData>((ref) {
  // Return the default data for now. When you set up Firebase,
  // you can change this to a FutureProvider or StateNotifierProvider.
  return PortfolioData(
    profileInfo: ProfileInfo(
      name: "MD. Roman Dewan",
      role: "App Developer (Flutter)",
      location: "Tongi, Gazipur, Dhaka, Bangladesh",
      email: "roman.dewan18@gmail.com",
      phone: "+8801521-738765",
      summary: "Highly motivated and dedicated Flutter Developer currently pursuing a B.Sc. in CSE at Uttara University. Consistent in self-learning with a strong passion for developing beautiful, efficient cross-platform mobile apps. Eager to contribute my skills to a professional team.",
      linkedinUrl: "https://linkedin.com/",
      githubUrl: "https://github.com/",
    ),
    skills: ["Flutter", "Dart", "C", "C++", "C#", "Java", "Python", "HTML5", "CSS3", "SQL"],
    education: [
      TimelineItem(
        title: "B.Sc. in Computer Science and Engineering",
        subtitle: "Uttara University",
        date: "2023 - Present",
      ),
    ],
    experience: [
      TimelineItem(
        title: "App Developer (Flutter)",
        subtitle: "EON SYSTEMS",
        date: "December 2025 - Present",
      ),
    ],
    services: [
      ServiceItem(title: "Cross-Platform App Development", iconName: "phone_android"),
      ServiceItem(title: "UI/UX Implementation", iconName: "design_services"),
      ServiceItem(title: "API Integration", iconName: "api"),
    ],
    pricingPlans: [
      PricingPlan(
        title: "Basic App",
        price: "Contact",
        description: "Perfect for simple MVP apps.",
        features: ["Single Platform (Android/iOS)", "Basic UI/UX Design", "No API Integration", "1 Month Support"],
        isPopular: false,
      ),
      PricingPlan(
        title: "Standard App",
        price: "Contact",
        description: "Great for most standard apps.",
        features: ["Cross Platform (Android & iOS)", "Premium Custom UI/UX", "REST API Integration", "State Management", "3 Months Support"],
        isPopular: true,
      ),
      PricingPlan(
        title: "Enterprise Solution",
        price: "Contact",
        description: "For complex, scalable needs.",
        features: ["Web, Android & iOS", "Advanced Animations & Polish", "Complex API/Backend Auth", "Advanced Local Caching", "6 Months Support"],
        isPopular: false,
      ),
    ],
    projects: [
      ProjectItem(
        title: "Blood Donation App",
        description: "Fully completed. Connected donors and recipients based on blood type/location. Features full UI/UX, API service architecture, and user authentication.",
        url: "",
      ),
      ProjectItem(
        title: "E-learning Platform",
        description: "Cross-platform (App & Web) learning solution.",
        url: "",
      ),
      ProjectItem(
        title: "E-commerce App",
        description: "Modern shopping experience with seamless navigation.",
        url: "",
      ),
      ProjectItem(
        title: "Task Manager App",
        description: "Complete productivity app with Provider state management, RESTful APIs, local caching, and full CRUD functionality.",
        url: "",
      ),
      ProjectItem(
        title: "Pet Mates Website",
        description: "Dynamic frontend pet adoption platform using HTML/CSS/JS.",
        url: "",
      ),
    ],
  );
});
