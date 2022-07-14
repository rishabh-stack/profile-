import '../screens/email_auth/login_screen.dart';
import '../screens/home_screen.dart';
import '../pdf/pdf_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../screens/email_auth/signup_screen.dart';

List<GetPage> getPages = [
  GetPage(
      name: '/',
      page: () => (FirebaseAuth.instance.currentUser != null)
          ? const Home()
          : const LoginScreen()),
  GetPage(name: '/resume/:user', page: () => const PdfPage()),
  GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      transition: Transition.cupertino),
  GetPage(
      name: '/signup',
      page: () => const SignUpScreen(),
      transition: Transition.cupertino),
  // GetPage(
  //     name: '/home',
  //     page: () => const Home(),
  //     transition: Transition.cupertino),
];
