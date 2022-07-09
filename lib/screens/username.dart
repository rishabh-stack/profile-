import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/screens/email_auth/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/services/firebase_auth_methods.dart';
import 'package:project/widgets/custom_button.dart';
import 'package:project/utils/showSnackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({Key? key}) : super(key: key);

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  TextEditingController usernameController = TextEditingController();

  final user = FirebaseAuthMethods(FirebaseAuth.instance).user;

  void createUserName() async {
    if (usernameController.text != '') {
      FirebaseFirestore.instance
          .collection("users")
          .where("username", isEqualTo: usernameController.text)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          showSnackBar(context, 'Username already exits try a different one');
        } else {
          FirebaseFirestore.instance.collection("users").doc(user.email).set(
              {'username': usernameController.text},
              SetOptions(merge: true)).then((value) {
            showSnackBar(context, 'Username added successfully');
            Future.delayed(Duration(seconds: 1), () {
              Navigator.pushReplacement(
                  context, CupertinoPageRoute(builder: (context) => Home()));
            });
          });
        }
      });
    } else {
      showSnackBar(context, 'Username field is empty! please add a username');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Please add a username to your Aamtspn account"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: "Enter Username"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      createUserName();
                    },
                    color: Colors.blue,
                    child: Text("Save Username"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
