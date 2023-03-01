// ignore_for_file: prefer_const_constructors, unused_import, implementation_imports, unnecessary_import, file_names, sort_child_properties_last, use_build_context_synchronously, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:project1/services/authservices.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'home.dart';

bool loading = false;

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            color: Color(0xFF0F2027),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Image.asset("assets/signupm.jpg"),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF9F9F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F2027),
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          obscureText: true,
                          controller: emailController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 3,
                                color: Color(0xFF0F2027),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "EMAIL",
                            labelStyle: TextStyle(
                              color: Color(0xFF0F2027),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 3,
                                color: Color(0xFF0F2027),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "PASSWORD",
                            labelStyle: TextStyle(
                              color: Color(0xFF0F2027),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          obscureText: true,
                          controller: confirmpasswordController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 3,
                                color: Color(0xFF0F2027),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "CONFIRM PASSWORD",
                            labelStyle: TextStyle(
                              color: Color(0xFF0F2027),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (emailController.text == "" ||
                                  passwordController.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("All fields are to be filled"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else if (passwordController.text !=
                                  confirmpasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Enter correct password"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                User? result = await Authservice().Register(
                                    emailController.text,
                                    passwordController.text,
                                    context);
                                if (result != null) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => home_page()),
                                      (route) => false);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Error occured"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0F2027),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              child: Divider(
                                color: Color(0xFF0F2027),
                              ),
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              " Or Via Social Media ",
                              style: TextStyle(
                                color: Color(0xFF0F2027),
                              ),
                            ),
                            SizedBox(
                              child: Divider(
                                color: Color(0xFF0F2027),
                              ),
                              height: 100,
                              width: 100,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      loading
                          ? CircularProgressIndicator()
                          : Center(
                              child: Center(
                                child: Container(
                                  height: 50.0,
                                  width: 330.0,
                                  child: SignInButton(Buttons.Google,
                                      onPressed: () async {
                                    setState(
                                      () {
                                        loading == true;
                                      },
                                    );
                                    await Authservice().signInWithGoogle();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => home_page(),
                                        ),
                                        (route) => false);
                                    setState(
                                      () {
                                        loading = false;
                                      },
                                    );
                                  }),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
