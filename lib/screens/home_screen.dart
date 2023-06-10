import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              //background 1 for app

              // SizedBox(
              //   width: double.infinity,
              //   height: double.infinity,
              //   child: SvgPicture.asset("assets/images/bg.svg", fit: BoxFit.fill),
              // ),
              // background 2 for app

              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset("assets/images/bg2.jpeg", fit: BoxFit.fill),
              ),

              Padding(
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
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.white),
                          labelText: 'Enter your Name',
                          hintText: 'Name',
                          fillColor: const Color(0xFF1A2330),
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 2.0)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 2.0)),
                        ),
                      ),

                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 50)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF12386D)),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: Text(
                          'Log in'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
