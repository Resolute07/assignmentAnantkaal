import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
        ],
      ),
    );
  }
}
