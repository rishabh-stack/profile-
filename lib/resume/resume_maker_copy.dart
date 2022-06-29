import 'package:flutter/material.dart';
import 'package:project/resume/widgets/experience.dart';
import './widgets/personal_details.dart';
import './widgets/education.dart';
import './widgets/experience.dart';

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
                    Experience(),
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
