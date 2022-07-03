import 'package:flutter/material.dart';
import 'dart:async';
import 'package:localstorage/localstorage.dart';

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
  TextEditingController summaryController = TextEditingController();
  late Timer timer;
  final LocalStorage storage = new LocalStorage('aamtspn');

  void updateResume() async {
    String name = nameController.text.trim();
    String lastname = lastnameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    Map<String, dynamic> personal = {
      "name": name,
      "lastname": lastname,
      "email": email,
      "phone": phone,
    };
    storage.setItem('personaldetail', personal);
  }

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      updateResume();
    });
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
      ],
    );
  }
}
