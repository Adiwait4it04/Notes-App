// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project1/onboardingsreens/screen1.dart';
import 'package:project1/onboardingsreens/screen2.dart';
import 'package:project1/screens/OnBoarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
