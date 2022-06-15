import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/firebase_options.dart';
import 'package:project/services/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/widgets/custom_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final double coverHeight = 280;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuthMethods(FirebaseAuth.instance).user;
    final email = user.email;
    final name = user.displayName;
    final Image = user.photoURL;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
        title: Text('Hello $email'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                fixedSize: Size.fromHeight(10),
                textStyle: TextStyle(color: Colors.blue),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () =>
                  {FirebaseAuthMethods(FirebaseAuth.instance).signOut(context)},
              icon: Icon(
                Icons.logout,
              ),
              label: Text(
                'SignOut',
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    //                   <--- left side
                    color: Colors.grey,
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.25,
              //height: MediaQuery.of(context).size.height*0.50,

              child: Column(
                children: <Widget>[
                  buildTop(),
                  buildContent(),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              //height: MediaQuery.of(context).size.height*0.50,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (!user.emailVerified && !user.isAnonymous)
                                CustomButton(
                                  onTap: () {
                                    FirebaseAuthMethods(FirebaseAuth.instance)
                                        .sendEmailVerification(context);
                                  },
                                  text: 'Email not verified!   Verify Email',
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Help'),
        backgroundColor: Colors.red[600],
      ),
    );
  }

  Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: Image.network(
        'https://media.istockphoto.com/photos/dark-blue-grunge-background-picture-id170958625?b=1&k=20&m=170958625&s=170667a&w=0&h=xG_DER6VK7CEXuPh0TUQu7H_xqlF_LZ0uNgumm40ylw=',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ));

  Widget buildProfileImage() => CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: NetworkImage(
          'https://media-exp2.licdn.com/dms/image/C560BAQH_1D47hfHBCQ/company-logo_200_200/0/1622694492980?e=1663200000&v=beta&t=Wry9l_63x5JajM2ZflulafSYvuhhKtqeYlM03RDwG60'));

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(top: top, child: buildProfileImage()),
      ],
    );
  }

  Widget buildContent() {
    return (Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(height: 8),
          Text('Aamtspn',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(
            'Designation',
            style: TextStyle(fontSize: 20, color: Colors.black38),
          ),
          const SizedBox(height: 8),
          Text('gmail'),
          const SizedBox(height: 8),
          Text('Mobile'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildIcon(FontAwesomeIcons.facebook),
              buildIcon(FontAwesomeIcons.instagram),
              buildIcon(FontAwesomeIcons.twitter),
              buildIcon(FontAwesomeIcons.linkedin),
            ],
          )
        ],
      ),
    ));
  }

  Widget buildIcon(IconData icon) => CircleAvatar(
      radius: 25,
      child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
              child: Icon(icon, size: 32),
            ),
          )));
}
