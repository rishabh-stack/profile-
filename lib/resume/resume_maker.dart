import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();



  void saveBio () async{
    String name = nameController.text.trim();
    String email = emailController.text.trim();

    nameController.clear();
    emailController.clear();

    if(name != "" && email !=""){
      Map<String, dynamic> newUserBio = {
        "name" : name,
        "email" : email,
      };
      await FirebaseFirestore.instance.collection("bio").add(newUserBio);
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('User created.'),
        action: SnackBarAction(
          label: 'Okay',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Please fill all the required fields.'),
        action: SnackBarAction(
          label: 'Okay',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

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
                    CupertinoButton(child: Text("Save"), onPressed: (){
                      saveBio();
                    }),
                    Education(),
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
