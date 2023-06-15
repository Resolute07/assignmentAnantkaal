import 'package:flutter/material.dart';
import 'package:quiz_app/custom_widget/progress_bar.dart';
import 'package:quiz_app/custom_widget/question_card.dart';
import 'package:quiz_app/controller/controller.dart';
import 'package:quiz_app/custom_widget/top_bar.dart';
import 'package:quiz_app/screens/custom_screen.dart';

import '../constants.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  static const id = '/questionScreen';

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
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
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopBar(),
                    const ProgressBar(totalTime: XController.totalTime),
                    const SizedBox(height: 30),

                    //this text represents the current question out of the total questions given
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
