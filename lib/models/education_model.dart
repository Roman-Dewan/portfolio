class EducationModel {
  final String degree;
  final String university;
  final String duration;
  final List<String> details;
  final List<String> tags;

  const EducationModel({
    required this.degree,
    required this.university,
    required this.duration,
    required this.details,
    required this.tags,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
        degree: json['degree'],
        university: json['university'],
        duration: json['duration'],
        details: List<String>.from(json['details']),
        tags: List<String>.from(json['tags']),
      );

  Map<String, dynamic> toJson() => {
        'degree': degree,
        'university': university,
        'duration': duration,
        'details': details,
        'tags': tags,
      };
}
