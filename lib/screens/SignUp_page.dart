// ignore_for_file: prefer_const_constructors, unused_import, implementation_imports, unnecessary_import, file_names

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Color(0xFF17282F),
              child: Padding(
                padding: const EdgeInsets.all(70),
                child: Center(
                  child: Image.asset('assets/signup.jpg'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70.0),
                  topLeft: Radius.circular(70.0),
                ),
                color: Color(0xFFD5D5D5),
              ),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF17282F),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
