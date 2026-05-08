class PortfolioData {
  final ProfileInfo profileInfo;
  final List<String> skills;
  final List<TimelineItem> education;
  final List<TimelineItem> experience;
  final List<ServiceItem> services;
  final List<PricingPlan> pricingPlans;
  final List<ProjectItem> projects;

  PortfolioData({
    required this.profileInfo,
    required this.skills,
    required this.education,
    required this.experience,
    required this.services,
    required this.pricingPlans,
    required this.projects,
  });

  factory PortfolioData.fromJson(Map<String, dynamic> json) {
    return PortfolioData(
      profileInfo: ProfileInfo.fromJson(json['profileInfo'] ?? {}),
      skills: List<String>.from(json['skills'] ?? []),
      education: (json['education'] as List? ?? []).map((e) => TimelineItem.fromJson(e)).toList(),
      experience: (json['experience'] as List? ?? []).map((e) => TimelineItem.fromJson(e)).toList(),
      services: (json['services'] as List? ?? []).map((e) => ServiceItem.fromJson(e)).toList(),
      pricingPlans: (json['pricingPlans'] as List? ?? []).map((e) => PricingPlan.fromJson(e)).toList(),
      projects: (json['projects'] as List? ?? []).map((e) => ProjectItem.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profileInfo': profileInfo.toJson(),
      'skills': skills,
      'education': education.map((e) => e.toJson()).toList(),
      'experience': experience.map((e) => e.toJson()).toList(),
      'services': services.map((e) => e.toJson()).toList(),
      'pricingPlans': pricingPlans.map((e) => e.toJson()).toList(),
      'projects': projects.map((e) => e.toJson()).toList(),
    };
  }
}

class ProfileInfo {
  final String name;
  final String role;
  final String location;
  final String email;
  final String phone;
  final String summary;
  final String linkedinUrl;
  final String githubUrl;

  ProfileInfo({
    required this.name,
    required this.role,
    required this.location,
    required this.email,
    required this.phone,
    required this.summary,
    required this.linkedinUrl,
    required this.githubUrl,
  });

  factory ProfileInfo.fromJson(Map<String, dynamic> json) {
    return ProfileInfo(
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      location: json['location'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      summary: json['summary'] ?? '',
      linkedinUrl: json['linkedinUrl'] ?? '',
      githubUrl: json['githubUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'location': location,
      'email': email,
      'phone': phone,
      'summary': summary,
      'linkedinUrl': linkedinUrl,
      'githubUrl': githubUrl,
    };
  }
}

class TimelineItem {
  final String title;
  final String subtitle;
  final String date;

  TimelineItem({required this.title, required this.subtitle, required this.date});

  factory TimelineItem.fromJson(Map<String, dynamic> json) {
    return TimelineItem(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'date': date,
    };
  }
}

class ServiceItem {
  final String title;
  final String iconName;

  ServiceItem({required this.title, required this.iconName});

  factory ServiceItem.fromJson(Map<String, dynamic> json) {
    return ServiceItem(
      title: json['title'] ?? '',
      iconName: json['iconName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'iconName': iconName,
    };
  }
}

class PricingPlan {
  final String title;
  final String price;
  final String description;
  final List<String> features;
  final bool isPopular;

  PricingPlan({
    required this.title,
    required this.price,
    required this.description,
    required this.features,
    required this.isPopular,
  });

  factory PricingPlan.fromJson(Map<String, dynamic> json) {
    return PricingPlan(
      title: json['title'] ?? '',
      price: json['price'] ?? '',
      description: json['description'] ?? '',
      features: List<String>.from(json['features'] ?? []),
      isPopular: json['isPopular'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'features': features,
      'isPopular': isPopular,
    };
  }
}

class ProjectItem {
  final String title;
  final String description;
  final String url;

  ProjectItem({required this.title, required this.description, required this.url});

  factory ProjectItem.fromJson(Map<String, dynamic> json) {
    return ProjectItem(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
    };
  }
}
