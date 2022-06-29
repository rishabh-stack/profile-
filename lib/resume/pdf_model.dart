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

class Experiences {
  String sectionId;
  String jobtitle;
  String employer;
  String startDate;
  String endDate;
  String city;

  Experiences({
    required this.sectionId,
    required this.jobtitle,
    required this.employer,
    required this.startDate,
    required this.endDate,
    required this.city,
  });

  factory Experiences.createEmpty() {
    return Experiences(
      sectionId: uuid.v4(),
      jobtitle: 'Untitled Job Title',
      employer: '',
      startDate: "",
      endDate: "",
      city: "",
    );
  }

  factory Experiences.fromJson(Map<String, dynamic> json) => new Experiences(
        sectionId: json["sectionId"],
        jobtitle: json["jobtitle"],
        employer: json["employer"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "jobtitle": jobtitle,
        "employer": employer,
        "startDate": startDate,
        "endDate": endDate,
        "city": city,
      };
}

// skill model

class Skills {
  String sectionId;
  String skillname;

  Skills({
    required this.sectionId,
    required this.skillname,
  });

  factory Skills.createEmpty() {
    return Skills(
      sectionId: uuid.v4(),
      skillname: 'TEST',
    );
  }

  factory Skills.fromJson(Map<String, dynamic> json) => new Skills(
        sectionId: json["sectionId"],
        skillname: json["skillname"],
      );

  Map<String, dynamic> toJson() => {
        "skillname": skillname,
      };
}

class Resume {
  List<Educations> educations;
  List<Experiences> experiences;
  List<Skills> skills;
  Resume({
    required this.educations,
    required this.experiences,
    required this.skills,
  });

  factory Resume.fromJson(Map<String, dynamic> json) {
    var experiencesList = json['experiences'] as List;
    var educationsList = json['educations'] as List;
    var skillsList = json['skills'] as List;
    List<Educations> educations =
        educationsList.map((i) => Educations.fromJson(i)).toList();
    List<Experiences> experiences =
        experiencesList.map((i) => Experiences.fromJson(i)).toList();
    List<Skills> skills = skillsList.map((i) => Skills.fromJson(i)).toList();

    return Resume(
      educations: educations,
      experiences: experiences,
      skills: skills,
    );
  }

  Map<String, dynamic> toJson() => {
        "educations": educations,
        "experiences": experiences,
        "skills": experiences,
      };
}
