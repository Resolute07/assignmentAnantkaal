import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/screens/custom_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final _localBox = Hive.box('localBox');
  final TextEditingController _nameController = TextEditingController();
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LinearProgressIndicator(
                value: 0.90,
                minHeight: 10,
                backgroundColor: Color(0xFFEAFAF5),
                valueColor: AlwaysStoppedAnimation(Color(0xFF07BD84)),
              ),
              Row(
                children: const [
                  Text(
                    "Question1/",
                    style: TextStyle(),
                  ),
                  Text("10"),
                ],
              ),
              const SizedBox(height: 50),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Center(
                      child: Text(
                    'card',
                    style: TextStyle(color: Colors.black87),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
