class AchievementModel {
  final String year;
  final String title;
  final String organization;
  final String description;

  const AchievementModel({
    required this.year,
    required this.title,
    required this.organization,
    required this.description,
  });

  factory AchievementModel.fromJson(Map<String, dynamic> json) => AchievementModel(
        year: json['year'],
        title: json['title'],
        organization: json['organization'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'title': title,
        'organization': organization,
        'description': description,
      };
}
