import 'package:firebase_core/firebase_core.dart';
import '/firebase_options.dart';
import './screens/email_auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import './route/route.dart';
import 'package:get/get.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Aamtspn Resume",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      unknownRoute: GetPage(name: '/error', page: () => const LoginScreen()),
      getPages: getPages,
    );
  }
}
