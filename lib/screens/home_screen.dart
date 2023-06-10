import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/screens/custom_screen.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            padding: const EdgeInsets.all(40.0),
            child: SizedBox(
              width: double.infinity,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                  //text field for input for user name
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.white),
                      labelText: 'Enter your Name',
                      hintText: 'Name',
                      fillColor: const Color(0xFF1A2330),
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2.0)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2.0)),
                    ),
                  ),

                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF12386D)),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(
                      'Start Quiz'.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      _localBox.putAll({'currentUser': _nameController.text});
                      List<dynamic>? userList = _localBox.get('users');

                      if (userList == null) {
                        // users list is null create a new list and input
                        List<dynamic>? tempList = [];
                        tempList.add(
                            {'userName': _nameController.text, 'score': 0});
                        _localBox.putAll({'users': tempList});
                      } else {
                        if (userList.length >= 10) {
                          //if not null check the length is checked and last user is deleted
                          userList.removeAt(0);
                        }
                        //the new user is added
                        userList.add(
                            {'userName': _nameController.text, 'score': 0});
                        _localBox.putAll({'users': userList});
                      }
                      final data = _localBox.get('users');

                      print(data);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
