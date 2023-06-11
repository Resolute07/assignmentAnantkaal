import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/controller.dart';
import 'package:quiz_app/screens/question_screen.dart';

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
    Timer(const Duration(seconds: 3), () async {
      NavigatorState state = Navigator.of(context);
      await XController.getData();
      state.pushNamed(QuestionScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blueGrey],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: AnimatedOpacity(
          opacity: _opacityLevel,
          duration: const Duration(seconds: 2),
          child: Center(
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2.0,
                    offset: const Offset(5.0, 3.0),
                    spreadRadius: 2.0,
                  )
                ],
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/quiz.png',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
