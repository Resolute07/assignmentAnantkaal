import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({super.key, this.child, this.alignment, this.appBar});

  final Widget? child;
  final AppBar? appBar;
  final AlignmentGeometry? alignment;

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
        appBar: widget.appBar,
        body: SafeArea(
          child: Stack(
            alignment: widget.alignment == null
                ? AlignmentDirectional.topStart
                : widget.alignment!,
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
