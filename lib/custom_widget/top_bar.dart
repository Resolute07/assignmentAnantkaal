import 'package:flutter/material.dart';
import 'package:quiz_app/controller/controller.dart';
import 'package:quiz_app/screens/home_screen.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.id);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          InkWell(
            onTap: () {
              XController.goToScoreScreen(context);
            },
            child: const Text('skip'),
          )
        ],
      ),
    );
  }
}
