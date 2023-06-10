import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/question_card.dart';
import 'package:quiz_app/screens/custom_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  bool _started = false;
  static const totalTime = 60;
  PageController _pageController = PageController();
  String _timeString = "$totalTime";

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeString = "${totalTime - timer.tick}";
        _started = true;
        if (timer.tick == totalTime) {
          timer.cancel();
        }
      });
    });
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
                  padding: EdgeInsets.all(20.0),
                  child: Text("Skip",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFF3F4768), width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(seconds: totalTime),
                          width:
                              _started ? MediaQuery.of(context).size.width : 30,
                          height: 30,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: const Color(0xFF3F4768), width: 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$_timeString Sec"),
                        )
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "Question 1",
                          style:
                              TextStyle(fontSize: 40, color: Color(0xFF8B94BC)),
                        ),
                        Text("/10",
                            style: TextStyle(
                                fontSize: 30, color: Color(0xFF8B94BC))),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Expanded(
                      child: PageView(
                        //pageSnapping: false,
                        controller: _pageController,
                        children: const [QuestionCard(), QuestionCard()],
                      ),
                    ),
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
