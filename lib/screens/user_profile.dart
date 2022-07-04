import 'package:flutter/material.dart';
import '../resume/pdf_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/services/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

class UserProfile extends StatefulWidget {
  //final List<Educations> educationLists;
  UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List<dynamic> educationList = <dynamic>[];

  List<dynamic> experienceList = <dynamic>[];

  List<dynamic> skillsList = <dynamic>[];

  List<dynamic> linksList = <dynamic>[];

  final user = FirebaseAuthMethods(FirebaseAuth.instance).user;

  void saveBio() async {
    final user = FirebaseAuthMethods(FirebaseAuth.instance).user;
    final docRef =
        FirebaseFirestore.instance.collection("users").doc(user.email);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;

        setState(() {
          educationList = (jsonDecode(data['educations'])) ?? [];
          experienceList = (jsonDecode(data['experiences'])) ?? [];
          skillsList = (jsonDecode(data['skills'])) ?? [];
          linksList = (jsonDecode(data['links'])) ?? [];
          WidgetsFlutterBinding.ensureInitialized();
        });
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  // WidgetsBinding.instance.addPostFrameCallback((_) => saveBio(context));

  @override
  void initState() {
    super.initState();
    saveBio();
  }

  // List<Experiences> experienceList = <Experiences>[
  //   Experiences(
  //     sectionId: uuid.v4(),
  //     jobtitle: 'Member Technical',
  //     employer: 'Web Development Cell, NIT Sikkim',
  //     startDate: "Sep 2020",
  //     endDate: "Present (1 yr 11 mos)",
  //     city: "",
  //   ),
  //   Experiences(
  //     sectionId: uuid.v4(),
  //     jobtitle: 'Member Technical',
  //     employer: 'Web Development Cell, NIT Sikkim',
  //     startDate: "Sep 2020",
  //     endDate: "Present (1 yr 11 mos)",
  //     city: "",
  //   ),
  //   Experiences(
  //     sectionId: uuid.v4(),
  //     jobtitle: 'Member Technical',
  //     employer: 'Web Development Cell, NIT Sikkim',
  //     startDate: "Sep 2020",
  //     endDate: "Present (1 yr 11 mos)",
  //     city: "",
  //   ),
  // ];

  // List<Skills> skillsList = <Skills>[
  //   Skills(
  //     sectionId: uuid.v4(),
  //     skillname: 'Software Development',
  //   ),
  //   Skills(
  //     sectionId: uuid.v4(),
  //     skillname: 'Flutter',
  //   ),
  //   Skills(
  //     sectionId: uuid.v4(),
  //     skillname: 'CSS',
  //   ),
  //   Skills(
  //     sectionId: uuid.v4(),
  //     skillname: 'HTML',
  //   ),
  //   Skills(
  //     sectionId: uuid.v4(),
  //     skillname: 'React.js',
  //   ),
  //   Skills(
  //     sectionId: uuid.v4(),
  //     skillname: 'MongoDB',
  //   ),
  //   Skills(
  //     sectionId: uuid.v4(),
  //     skillname: 'TEST',
  //   ),
  //   Skills(
  //     sectionId: uuid.v4(),
  //     skillname: 'TEST',
  //   ),
  //   Skills(
  //     sectionId: uuid.v4(),
  //     skillname: 'TEST',
  //   ),
  // ];

  // List<Links> linksList = <Links>[
  //   Links(
  //     sectionId: uuid.v4(),
  //     linkname: 'LinkedIn',
  //     linkurl: 'https://www.linkedin.com/in/saurav-kumar-7619441b9/',
  //   ),
  //   Links(
  //     sectionId: uuid.v4(),
  //     linkname: 'Instagram',
  //     linkurl: '',
  //   ),
  //   Links(
  //     sectionId: uuid.v4(),
  //     linkname: 'Website',
  //     linkurl: '',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Personal Details
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: user.email != null
                ? Text('${user.displayName}',
                    style: TextStyle(
                      fontSize: 20.0,
                    ))
                : Text("Please Login"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
            child: Row(children: <Widget>[
              Icon(Icons.mail_outline),
              SizedBox(width: 2.0),
              Text('${user.email ?? "Please login"}'),
            ]),
          ),
          // Education
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0),
            child: Text("Education",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: educationList.isEmpty == true
                ? const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0)
                : const EdgeInsets.all(0.0),
            child: educationList.isEmpty == true
                ? const Text("Please fill the deatils")
                : const Text(""),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: educationList.length ?? 0,
                      itemBuilder: (context, index) {
                        var data = educationList[index];
                        return Padding(
                          key:
                              Key(educationList[index]['sectionId'].toString()),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 2.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    child: Text(
                                        data['universityName'].toString() ?? "",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    child: Text(
                                        '${data['degree'].toString() ?? ""} - ${data['courseTaken'].toString() ?? ""}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    child: Text(
                                        '${data['startDate'].toString() ?? ""} - ${data['endDate'].toString() ?? ""}'),
                                  ),
                                ],
                              )),
                        );
                      }),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0),
            child: Text("Experience",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: experienceList.isEmpty == true
                ? const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0)
                : const EdgeInsets.all(0.0),
            child: experienceList.isEmpty == true
                ? const Text("Please fill the deatils")
                : const Text(""),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: experienceList.length ?? 0,
                      itemBuilder: (context, index) {
                        var data = experienceList[index];
                        return Padding(
                          key: Key(
                              experienceList[index]['sectionId'].toString()),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 2.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    child:
                                        Text(data['jobtitle'].toString() ?? "",
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                            )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    child: Text('${data['employer'] ?? ""}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    child: Text(
                                        '${data['startDate'].toString() ?? ""} - ${data['endDate'].toString() ?? ""}'),
                                  ),
                                ],
                              )),
                        );
                      }),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0),
            child: Text("Skills",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: skillsList.isEmpty == true
                ? const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0)
                : const EdgeInsets.all(0.0),
            child: skillsList.isEmpty == true
                ? const Text("Please fill the deatils")
                : const Text(""),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: SizedBox(
                width: double.infinity,
                height: skillsList.isEmpty == true ? 0 : 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: skillsList.length ?? 0,
                  itemBuilder: (BuildContext ctx, index) {
                    var data = skillsList[index];
                    return Container(
                      margin: const EdgeInsets.all(5),
                      color: Colors.grey,
                      width: 120,
                      alignment: Alignment.center,
                      child: Text(
                        data['skillname'].toString() ?? "",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    );
                  },
                )),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 2.0),
            child: Text("Links",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: linksList.isEmpty == true
                ? const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 2.0)
                : const EdgeInsets.all(0.0),
            child: linksList.isEmpty == true
                ? const Text("Please fill the deatils")
                : const Text(""),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: SizedBox(
                width: double.infinity,
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: linksList.length ?? 0,
                  itemBuilder: (BuildContext ctx, index) {
                    var data = linksList[index];
                    return Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 30, bottom: 2),
                        child: GestureDetector(
                          child: Text(data['linkname'].toString() ?? "",
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue)),
                          onTap: () async {
                            var url = (data['linkurl'].toString() ?? "");
                            if (await canLaunch(url)) launch(url);
                          },
                        ));
                  },
                )),
          ),
        ],
      )),
    );
  }
}
