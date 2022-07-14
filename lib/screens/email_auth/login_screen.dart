import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/screens/email_auth/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/services/firebase_auth_methods.dart';
import 'package:project/widgets/custom_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void loginUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    //Get.offAndToNamed('/home');
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Aamtspn"),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: width / 6.5 > 200.0 ? 500 : width / 6.5,
              vertical: 100.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 172, 172, 172),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
            BoxShadow(
              color: Color.fromARGB(255, 255, 255, 255),
              //offset: const Offset(-5, 0),
            )
          ]),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email Address",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                      onPressed: () {
                        loginUser();
                      },
                      color: Colors.blue,
                      child: Text("Log In"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text("Create an Account"),
                    ),
                  ],
                ),
              ),
              Text(
                'Or',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomButton(
                  onTap: () {
                    FirebaseAuthMethods(FirebaseAuth.instance)
                        .signInWithGoogle(context);
                  },
                  text: 'Google Sign In',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
