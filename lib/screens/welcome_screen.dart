import 'package:flutter/material.dart';
import 'package:quiz_app/screens/custom_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CustomScreen(
      child: Container(
        width: 140.0,
        height: 50.0,
        decoration: BoxDecoration(shape: BoxShape.rectangle, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 3.0,
            offset: const Offset(5.0, 3.0),
            spreadRadius: 2.0,
          )
        ]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          child: const Text(
            'START',
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height - 200);
    path.lineTo(0, height);
    path.close();

    // path.lineTo(0, height);
    // path.lineTo(0, height);
    // path.quadraticBezierTo(0, height + 70, width, height - 100);
    // path.lineTo(width, 0);
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
