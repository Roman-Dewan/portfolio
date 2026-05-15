class SkillModel {
  final String category;
  final List<String> skills;

  const SkillModel({
    required this.category,
    required this.skills,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        category: json['category'],
        skills: List<String>.from(json['skills']),
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'skills': skills,
      };
}
