import 'dart:developer';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class Educations {
  String sectionId;
  String universityName;
  String startDate;
  String endDate;
  String courseTaken;
  String degree;
  String gpa;

  Educations({
    required this.sectionId,
    required this.universityName,
    required this.startDate,
    required this.endDate,
    required this.courseTaken,
    required this.degree,
    required this.gpa,
  });

  factory Educations.createEmpty() {
    return Educations(
        sectionId: uuid.v4(),
        universityName: 'Untitled Sch',
        startDate: "",
        endDate: "",
        courseTaken: "",
        degree: "",
        gpa: "");
  }

  factory Educations.fromJson(Map<String, dynamic> json) => new Educations(
        sectionId: json["sectionId"],
        universityName: json["universityName"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        courseTaken: json["courseTaken"],
        degree: json["degree"],
        gpa: json["gpa"],
      );

  Map<String, dynamic> toJson() => {
        "universityName": universityName,
        "startDate": startDate,
        "endDate": endDate,
        "courseTaken": courseTaken,
        "degree": degree,
        "gpa": gpa,
      };
}

class Resume {
  List<Educations> educations;
  Resume({
    required this.educations,
  });

  factory Resume.fromJson(Map<String, dynamic> json) {
    var educationsList = json['educations'] as List;
    List<Educations> educations =
        educationsList.map((i) => Educations.fromJson(i)).toList();

    return Resume(
      educations: educations,
    );
  }

  Map<String, dynamic> toJson() => {
        "educations": educations,
      };
}
