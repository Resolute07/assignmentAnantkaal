import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quiz_app/custom_widget/option_card.dart';
import '../model_data/model_class.dart';

// This is a custom card to display the questions.

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    super.key,
    required this.modelClass,
  });
  //ModelClass is a class containing all the data we extracted from the api.
  final ModelClass modelClass;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  //used to convert the html escape character to raw String
  HtmlUnescape unescape = HtmlUnescape();

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
              //covert escape character to string here and the question for the quiz is printed
              unescape.convert(widget.modelClass.question),
              style: const TextStyle(color: Colors.black),
            ),

            const SizedBox(height: 20),

            //here we generate the options for the current question,
            //the OptionCardClass iss Used
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
