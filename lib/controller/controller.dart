import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/screens/score_screen.dart';
import '../model_data/model_class.dart';

class XController {
  static List<ModelClass> results = [];
  static PageController pageController = PageController();
  static int currentQuestionIndex = 1;
  static int totalQuestions = 0;
  static int correctAnsweredNumber = 0;
  static String currentUserName = "";
  static const int totalTime = 30;
  static List<dynamic>? history = [];
  static dynamic localBox;

  static init() {
    pageController = PageController();
    currentQuestionIndex = 1;
    currentUserName = "";
    totalQuestions = results.length;
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

  static bool checkAnswer(option, correctAnswer) {
    if (option == correctAnswer) {
      correctAnsweredNumber += 1;
      return true;
    } else {
      return false;
    }
  }

  static void nextQuestion(BuildContext context) {
    Timer(
      const Duration(milliseconds: 500),
      () {
        if (currentQuestionIndex == totalQuestions) {
          goToScoreScreen(context);
        }
        XController.pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      },
    );
    //
  }

  static void updateHistory() {
    XController.history ??= [];
    if (XController.history!.length >= 10) {
      //if not null check the length is checked and last user is deleted
      XController.history?.removeAt(0);
    }
    //the new user name is added
    XController.history?.add({
      'userName': currentUserName,
      'score': "$correctAnsweredNumber / $totalQuestions"
    });
  }

  static void goToScoreScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, ScoreScreen.id);
  }
}
