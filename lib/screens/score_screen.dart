import 'package:flutter/material.dart';
import 'package:quiz_app/controller/controller.dart';
import 'package:quiz_app/custom_widget/custom_button.dart';
import 'package:quiz_app/screens/custom_screen.dart';
import 'package:quiz_app/screens/home_screen.dart';

import '../constants.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});
  static const id = '/ScoreScreen';

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      alignment: AlignmentDirectional.center,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  "WELL DONE!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  XController.currentUserName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                  maxLines: 1,
                ),
                const Text(
                  "press restart button to restart",
                  style: TextStyle(color: kSecondaryColor, fontSize: 10),
                ),
              ],
            ),
            const SizedBox(height: 50),
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
            CustomButton(
              text: 'Restart',
              onPressed: () {
                XController.results.shuffle();
                Navigator.pushReplacementNamed(context, HomeScreen.id);
                XController.init();
              },
            )
          ],
        ),
      ),
    );
  }
}
