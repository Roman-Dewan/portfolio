class ExperienceModel {
  final String role;
  final String company;
  final String duration;
  final List<String> responsibilities;
  final List<String> techTags;

  const ExperienceModel({
    required this.role,
    required this.company,
    required this.duration,
    required this.responsibilities,
    required this.techTags,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) => ExperienceModel(
        role: json['role'],
        company: json['company'],
        duration: json['duration'],
        responsibilities: List<String>.from(json['responsibilities']),
        techTags: List<String>.from(json['techTags']),
      );

  Map<String, dynamic> toJson() => {
        'role': role,
        'company': company,
        'duration': duration,
        'responsibilities': responsibilities,
        'techTags': techTags,
      };
}
