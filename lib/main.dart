import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/screens/username.dart';
import '/firebase_options.dart';
import './screens/email_auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:fluro/fluro.dart';
import './screens/home_screen_controller.dart';
import './pdf/pdf_page.dart';
import './route/route.dart';

void main() async {
  //setPathUrlStrategy();
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
    return MaterialApp(
      //onGenerateRoute: Routes.router.generator,
      onGenerateRoute: (settings) {
        // Handle '/'
        if (settings.name == '/') {
          return MaterialPageRoute(
              settings: settings, builder: (context) => MyHome());
        }

        // Handle '/details/:id'
        // var uri = Uri.parse(settings.name.toString());
        // if (uri.pathSegments.length == 2 &&
        //     uri.pathSegments.first == 'resume') {
        //   var user = uri.pathSegments[1];
        //   print('settings : $user');

        List<String> routeSplit = settings.name.toString().split('/');
        if (routeSplit[1] == 'resume' && routeSplit.length > 2) {
          String userId = routeSplit[2];
          return MaterialPageRoute(
              settings: settings, builder: (context) => PdfPage(user: userId));
        }

        return MaterialPageRoute(
            settings: settings, builder: (context) => LoginScreen());
      },
    );
  }
}
