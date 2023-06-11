import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/screens/score_screen.dart';
import 'model_class.dart';

class XController {
  static List<ModelClass> results = [];
  static PageController pageController = PageController();
  static int currentQuestionIndex = 1;
  static int totalQuestions = 0;
  static int correctAnsweredNumber = 0;

  static init() {
    pageController = PageController();
    currentQuestionIndex = 1;
    totalQuestions = 0;
    correctAnsweredNumber = 0;
  }

  static Future<void> getData() async {
    List<ModelClass> resultData = [];
    final http.Response response = await http
        .get(Uri.parse('https://opentdb.com/api.php?amount=10&type=boolean'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      //print(data);

      for (Map<String, dynamic> result in data['results']) {
        //print(result);
        resultData.add(ModelClass.fromJson(result));
      }
      totalQuestions = resultData.length;
      results = resultData;
    } else {
      results = resultData;
    }
  }

  late AnimationController _animationController;
  late Animation<double> _animation;

  static bool checkAnswer(option, correctAnswer) {
    if (option == correctAnswer) {
      correctAnsweredNumber += 1;
      return true;
    } else {
      return false;
    }
  }

  static void nextQuestion(BuildContext context) {
    if (currentQuestionIndex == totalQuestions) {
      Navigator.pushReplacementNamed(context, ScoreScreen.id);
    }
    Timer(
      const Duration(seconds: 1),
      () {
        XController.pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
    );

    //
  }
}
