import 'package:flutter/material.dart';
import 'package:quiz_app/progress_bar.dart';
import 'package:quiz_app/question_card.dart';
import 'package:quiz_app/controller.dart';
import 'package:quiz_app/screens/custom_screen.dart';

import '../constants.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  static const id = '/QuestionScreen';

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  static const totalTime = 60;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: CustomScreen(
        alignment: AlignmentDirectional.topStart,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.keyboard_arrow_left,
                  size: 40,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Text("Skip",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProgressBar(totalTime: totalTime),
                    const SizedBox(height: 30),

                    //this text represents the current question out of the total questions qiven
                    Text.rich(
                      TextSpan(
                        text: "Question ${XController.currentQuestionIndex}",
                        style: const TextStyle(
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        children: [
                          TextSpan(
                            text: "/${XController.totalQuestions}",
                            style: const TextStyle(
                                color: kSecondaryColor, fontSize: 20),
                          ),
                        ],
                      ),
                    ),

                    const Divider(
                      thickness: 1.5,
                    ),
                    const SizedBox(height: 20),

                    //This executes if the data from qpi extracted
                    if (XController.results.isNotEmpty)
                      Expanded(
                        child: PageView.builder(

                            // Block swipe to next question
                            physics: const NeverScrollableScrollPhysics(),

                            //page controller
                            controller: XController.pageController,

                            //on page change we go to next question
                            onPageChanged: (index) {
                              setState(() {
                                XController.currentQuestionIndex = index + 1;
                              });
                            },
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return QuestionCard(
                                modelClass: XController.results[index],
                              );
                            }),
                      ),

                    //this executes if the data from api is not extracted
                    if (XController.results.isEmpty)
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
