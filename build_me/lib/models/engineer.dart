// models/engineer.dart
class Engineer {
  final String id;
  final String firstname;
  final String bio;
  final List<String> skills;
  final List<String> projects;

  Engineer({
    required this.id,
    required this.firstname,
    required this.bio,
    required this.skills,
    required this.projects,
  });


  // Method to convert an Engineer object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': firstname,
      'bio': bio,
      'skills': skills,
      'projects': projects,
    };
  }
}
