// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

import 'dart:convert';

Courses coursesFromJson(String str) => Courses.fromJson(json.decode(str));

String coursesToJson(Courses data) => json.encode(data.toJson());

class Courses {
  Courses({
    required this.courses,
  });

  final List<Course> courses;

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
  };
}

class Course {
  Course({
    required this.name,
    required this.trimestres,
  });

  final String name;
  final List<Trimestre> trimestres;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    name: json["name"],
    trimestres: List<Trimestre>.from(json["trimestres"].map((x) => Trimestre.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "trimestres": List<dynamic>.from(trimestres.map((x) => x.toJson())),
  };
}

class Trimestre {
  Trimestre({
    required this.name,
    required this.themes,
  });

  final String name;
  final List<Theme> themes;

  factory Trimestre.fromJson(Map<String, dynamic> json) => Trimestre(
    name: json["name"],
    themes: List<Theme>.from(json["themes"].map((x) => Theme.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "themes": List<dynamic>.from(themes.map((x) => x.toJson())),
  };
}

class Theme {
  Theme({
    required this.name,
    required this.videos,
    required this.materials,
    required this.activities,
  });

  final String name;
  final List<String> videos;
  final List<String> materials;
  final List<String> activities;

  factory Theme.fromJson(Map<String, dynamic> json) => Theme(
    name: json["name"],
    videos: List<String>.from(json["videos"].map((x) => x)),
    materials: List<String>.from(json["materials"].map((x) => x)),
    activities: List<String>.from(json["activities"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "videos": List<dynamic>.from(videos.map((x) => x)),
    "materials": List<dynamic>.from(materials.map((x) => x)),
    "activities": List<dynamic>.from(activities.map((x) => x)),
  };
}
