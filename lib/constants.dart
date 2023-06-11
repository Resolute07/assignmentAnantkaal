import 'package:flutter/material.dart';

const Color kSecondaryColor = Color(0xFF8B94BC);
const Color kGreenColor = Color(0xFF6AC259);
const Color kRedColor = Color(0xFFE92E30);
const kWhiteColor = Color(0xFFFFFFFF);
Color kRedShade = Colors.red.shade50;
Color kGreenShade = Colors.green.shade50;
const kPrimaryGradient1 = Color(0xFF46A0AE);
const kPrimaryGradient2 = Color(0xFF00FFCB);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [kPrimaryGradient1, kPrimaryGradient2],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const kTimerIcon = Icon(Icons.timer);

const double kDefaultPadding = 20.0;

const colorizeColors = [
  kPrimaryGradient1,
  kPrimaryGradient2,
  kRedColor,
  Colors.blue,
  kGreenColor,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);

InputDecoration kInputDecoration = InputDecoration(
  labelStyle: const TextStyle(color: kWhiteColor),
  labelText: 'Name',
  hintText: 'Enter your name',
  fillColor: const Color(0xFF1A2330),
  filled: true,
  contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: kWhiteColor)),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.grey.shade400)),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: kRedColor, width: 2.0)),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: kRedColor, width: 2.0)),
);
