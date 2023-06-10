import 'package:flutter/material.dart';
import 'package:quiz_app/model_class.dart';

import 'constants.dart';

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
  Color shadeColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.red, width: 1),
          color: kRedShade),
      child: InkWell(
        onTap: () {
          if (widget.option == widget.correctAnswer) {
            primaryColor = kGreenColor;
            shadeColor = kGreenShade;
          } else {
            primaryColor = kRedColor;
            shadeColor = kRedShade;
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // answer
              Text(
                "${widget.index + 1}. ${widget.option}",
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),

              //checkbox
              Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: kRedColor),
                ),
                child: const Icon(
                  Icons.close,
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
