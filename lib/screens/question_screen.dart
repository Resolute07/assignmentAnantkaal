import 'package:flutter/material.dart';
import 'package:quiz_app/progress_bar.dart';
import 'package:quiz_app/question_card.dart';
import 'package:quiz_app/question_generator.dart';
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
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    QuestionGenerator.getData();
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
                    const Text.rich(
                      TextSpan(
                        text: "Question 1",
                        style: TextStyle(
                            color: kSecondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                        children: [
                          TextSpan(
                            text: "/10",
                            style:
                                TextStyle(color: kSecondaryColor, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    const SizedBox(height: 20),
                    FutureBuilder(
                        future: QuestionGenerator.getData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Expanded(
                              child: PageView.builder(
                                // Block swipe to next qn
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _pageController,
                                onPageChanged: (index) {},
                                itemCount: 10,
                                itemBuilder: (context, index) => QuestionCard(
                                  modelClass: QuestionGenerator.results[index],
                                ),
                              ),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        })
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
