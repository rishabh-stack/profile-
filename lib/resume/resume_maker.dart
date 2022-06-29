import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/resume/widgets/experience.dart';
import 'package:project/resume/widgets/skills.dart';
import './widgets/personal_details.dart';
import './widgets/education.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resume"),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    PersonalDetails(),
                    Education(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Experience(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Skill()
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Text("Column"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
