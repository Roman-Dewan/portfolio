class CertificationModel {
  final String year;
  final String title;
  final String issuer;
  final String description;

  const CertificationModel({
    required this.year,
    required this.title,
    required this.issuer,
    required this.description,
  });

  factory CertificationModel.fromJson(Map<String, dynamic> json) => CertificationModel(
        year: json['year'],
        title: json['title'],
        issuer: json['issuer'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'year': year,
        'title': title,
        'issuer': issuer,
        'description': description,
      };
}
