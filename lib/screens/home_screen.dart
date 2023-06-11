import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controller/controller.dart';
import 'package:quiz_app/custom_widget/custom_button.dart';
import 'package:quiz_app/screens/custom_screen.dart';
import 'package:quiz_app/screens/question_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _localBox = Hive.box('localBox');
  final TextEditingController _nameController = TextEditingController();
  var errorMessage = "";
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
          alignment: AlignmentDirectional.center,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SizedBox(
              width: double.infinity,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Let's Play Quiz",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 50),
                      ),
                      Text("Enter the information below"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      //text field for input for user name
                      TextField(
                        onTap: () {
                          setState(() {
                            errorMessage = "";
                          });
                        },
                        controller: _nameController,
                        decoration: kInputDecoration,
                      ),
                      const SizedBox(height: 10),
                      if (errorMessage.isNotEmpty)
                        Text(
                          errorMessage,
                          style: const TextStyle(color: kRedColor),
                        ),
                      const SizedBox(height: 30),
                      CustomButton(
                          text: 'Start Quiz',
                          onPressed: () {
                            if (_nameController.text.isEmpty) {
                              setState(() {
                                errorMessage = "Please Enter a Name";
                              });
                            } else {
                              _localBox.putAll(
                                  {'currentUser': _nameController.text});
                              List<dynamic>? userList = _localBox.get('users');

                              if (userList == null) {
                                // users list is null create a new list and input
                                List<dynamic>? tempList = [];
                                tempList.add({
                                  'userName': _nameController.text,
                                  'score': 0
                                });
                                _localBox.putAll({'users': tempList});
                              } else {
                                if (userList.length >= 10) {
                                  //if not null check the length is checked and last user is deleted
                                  userList.removeAt(0);
                                }
                                //the new user is added
                                userList.add({
                                  'userName': _nameController.text,
                                  'score': 0
                                });
                                _localBox.putAll({'users': userList});
                              }
                              XController.currentUserName =
                                  _nameController.text;
                              Navigator.pushReplacementNamed(
                                  context, QuestionScreen.id);
                            }
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
