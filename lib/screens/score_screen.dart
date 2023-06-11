import 'package:flutter/material.dart';
import 'package:quiz_app/controller.dart';
import 'package:quiz_app/screens/custom_screen.dart';
import 'package:quiz_app/screens/home_screen.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});
  static const id = '/ScoreScreen';

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Score",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${XController.correctAnsweredNumber * 10}/${XController.totalQuestions * 10}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                XController.results.shuffle();
                Navigator.pushReplacementNamed(context, HomeScreen.id);
                XController.init();
              },
              child: const Text("Restart")),
        ],
      ),
    );
  }
}
