import 'package:flutter/material.dart';
import 'package:quiz_app/option_card.dart';

import 'constants.dart';
import 'model_class.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    super.key,
    required this.modelClass,
  });

  final ModelClass modelClass;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  void checkAnswer(index) {
    if (CorrectAnswer.values[index] == widget.modelClass.correctAnswer) {}
  }

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
              widget.modelClass.question,
              style: const TextStyle(color: Colors.black),
            ),

            const SizedBox(height: 20),
            //options
            ...List.generate(
                2,
                (index) => OptionCard(
                      option: CorrectAnswer.values[index],
                      index: index,
                      correctAnswer: widget.modelClass.correctAnswer,
                    )

                //submit button
                ),
          ],
        ),
      ),
    );
  }
}
