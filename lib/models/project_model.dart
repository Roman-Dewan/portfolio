class ProjectModel {
  final String title;
  final String description;
  final List<String> techStack;
  final String githubUrl;
  final String? liveUrl;
  final String? imageUrl;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.techStack,
    required this.githubUrl,
    this.liveUrl,
    this.imageUrl,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        title: json['title'],
        description: json['description'],
        techStack: List<String>.from(json['techStack']),
        githubUrl: json['githubUrl'],
        liveUrl: json['liveUrl'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'techStack': techStack,
        'githubUrl': githubUrl,
        'liveUrl': liveUrl,
        'imageUrl': imageUrl,
      };
}
