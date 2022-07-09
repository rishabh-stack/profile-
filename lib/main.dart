import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/screens/username.dart';
import '/firebase_options.dart';
import './screens/email_auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aamtspn Resume',
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null)
          ? UsernameScreen()
          : LoginScreen(),
    );
  }
}
