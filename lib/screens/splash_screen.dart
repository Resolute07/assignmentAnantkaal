import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/controller/controller.dart';
import 'package:quiz_app/screens/custom_screen.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const id = '/';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  double _opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    //XController.getData();
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        _opacityLevel = 1.0;
      });
    });
    Timer(const Duration(seconds: 5), () async {
      NavigatorState state = Navigator.of(context);
      await XController.getData();
      state.pushReplacementNamed(HomeScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      alignment: AlignmentDirectional.center,
      child: AnimatedOpacity(
        opacity: _opacityLevel,
        duration: const Duration(seconds: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10.0,
                      offset: const Offset(4.0, 2.0),
                      spreadRadius: 2.0,
                    )
                  ],
                ),
                child: Image.asset('assets/images/letter_q.png'),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              totalRepeatCount: 5,
              animatedTexts: [
                ColorizeAnimatedText(
                  'Quiz',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
