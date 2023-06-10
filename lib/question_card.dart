import 'package:flutter/material.dart';
import 'package:quiz_app/option_card.dart';

import 'constants.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard(
      {super.key,
      required this.question,
      required this.options,
      required this.correctAnswer});

  final String question;
  final List<String> options;
  final String correctAnswer;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool _isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Question
            Text(
              widget.question,
              style: const TextStyle(color: Colors.black),
            ),

            const SizedBox(height: 20),
            //options
            ...List.generate(
                2,
                (index) =>
                    OptionCard(option: "true", index: index, press: () {}))

            //submit button
          ],
        ),
      ),
    );
  }
}
