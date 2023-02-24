// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project1/onboardingsreens/screen1.dart';
import 'package:project1/onboardingsreens/screen2.dart';
import 'package:project1/onboardingsreens/screen3.dart';
import 'package:project1/screens/SignUp_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _controller = PageController();
  bool onLastPage = false;
  bool onSecondLastPage = false;
  Text nextText = const Text(
    "Next",
    style: TextStyle(fontSize: 18),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              onLastPage = (index == 2);
              onSecondLastPage = (index == 1);
            },
            children: const [
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: JumpingDotEffect(
                    activeDotColor: Colors.black,
                    dotHeight: 5,
                    radius: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.all(10),
                      ),
                      onPressed: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.bounceInOut);
                        if (onLastPage) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Signup();
                              },
                            ),
                          );
                        }
                        if (onSecondLastPage) {
                          setState(() {
                            nextText = const Text(
                              "Get Started? :)",
                              style: TextStyle(fontSize: 14),
                            );
                          });
                        }
                      },
                      child: nextText),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
