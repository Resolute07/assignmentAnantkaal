import 'package:flutter/material.dart';

import 'constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard(
      {super.key,
      required this.option,
      required this.index,
      required this.press});
  final String option;
  final int index;
  final VoidCallback press;

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
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // answer
              Text(
                "${index + 1}. $option",
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
