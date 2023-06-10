import 'dart:async';

import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key, required this.totalTime});

  final int totalTime;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  String _timeString = "";
  bool _started = false;
  @override
  void initState() {
    _timeString = "${widget.totalTime}";
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeString = "${widget.totalTime - timer.tick}";
        _started = true;
        if (timer.tick == widget.totalTime) {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: double.infinity,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF3F4768), width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        AnimatedContainer(
          duration: Duration(seconds: widget.totalTime),
          width: _started ? MediaQuery.of(context).size.width : 30,
          height: 30,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: const Color(0xFF3F4768), width: 1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("$_timeString Sec"),
        )
      ],
    );
  }
}
