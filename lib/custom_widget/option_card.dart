import 'package:flutter/material.dart';
import 'package:quiz_app/controller/controller.dart';
import 'package:quiz_app/model_data/model_class.dart';

import '../constants.dart';

class OptionCard extends StatefulWidget {
  const OptionCard(
      {super.key,
      required this.option,
      required this.index,
      required this.correctAnswer});

  final CorrectAnswer option;
  final int index;
  final CorrectAnswer correctAnswer;

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  Color primaryColor = Colors.grey;
  Color shadeColor = Colors.transparent;
  bool localAnswered = false;

  IconData getIcon() =>
      (widget.option == widget.correctAnswer) ? Icons.done : Icons.close;

  bool getColors() {
    if (XController.checkAnswer(widget.option, widget.correctAnswer)) {
      setState(() {
        primaryColor = kGreenColor;
        shadeColor = kGreenShade;
      });
      return true;
    } else {
      setState(() {
        primaryColor = kRedColor;
        shadeColor = kRedShade;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: localAnswered && XController.isAnswered
                ? primaryColor
                : Colors.grey,
            width: 1,
          ),
          color: localAnswered && XController.isAnswered
              ? shadeColor
              : Colors.transparent),
      child: InkWell(
        onTap: () {
          setState(() {
            if (!XController.isAnswered) {
              getColors();
              localAnswered = true;
              XController.isAnswered = true;
              XController.nextQuestion(context);
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // answer
              Text(
                "${widget.index + 1}. ${widget.option.name}",
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),

              //checkbox
              Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: localAnswered && XController.isAnswered
                      ? primaryColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: localAnswered && XController.isAnswered
                          ? primaryColor
                          : Colors.grey),
                ),
                child: Icon(
                  getIcon(),
                  size: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
