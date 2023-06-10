import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({super.key, this.child});

  final Widget? child;

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
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
              // background Image for app

              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset("assets/images/bg2.jpeg", fit: BoxFit.fill),
              ),
              widget.child!,
            ],
          ),
        ),
      ),
    );
  }
}
