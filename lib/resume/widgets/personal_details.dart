import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/services/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void saveBio() async {
    final user = FirebaseAuthMethods(FirebaseAuth.instance).user;
    String name =
        nameController.text.trim() + ' ' + lastnameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();

    if (name != "" && email != "") {
      Map<String, dynamic> newUserBio = {
        "name": name,
        "email": email,
        "phone": phone
      };
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.email)
          .set(newUserBio);
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Data Added.'),
        action: SnackBarAction(
          label: 'Okay',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Basic Details",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: TextField(
                controller: lastnameController,
                decoration: InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: "Email Address",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextField(
          controller: phoneController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Phone Number",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        CupertinoButton(
            child: Text("Save Details"),
            onPressed: () {
              saveBio();
            }),
      ],
    );
  }
}
