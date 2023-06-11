import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/score_screen.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key, required this.totalTime});

  final int totalTime;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  static const double _globalHeight = 35;

  String _timeString = "";
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(seconds: widget.totalTime), vsync: this);
    _animationController.forward().whenComplete(() {
      Navigator.pushReplacementNamed(context, ScoreScreen.id);
    });
    _animationController.addListener(() {
      setState(() {
        _timeString = "${(_animationController.value * 60).round()} sec";
      });
    });
    _timeString = "${widget.totalTime}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _globalHeight,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF3F4768), width: 1),
          borderRadius: BorderRadius.circular(50)),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          LayoutBuilder(
            builder: (context, constraints) => Container(
              // from 0 to 1 it takes 60s
              width: constraints.maxWidth * _animationController.value,
              //here in order to make the transition smooth a max value was given
              height: constraints.maxWidth * _animationController.value * 2,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(_timeString), kTimerIcon],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
