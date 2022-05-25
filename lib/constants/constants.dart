import 'package:flutter/material.dart';

const Color scaffoldColor = Color(0xff131b26);
final Color opaciousGrey = Colors.grey.withOpacity(0.3);
final Color weekDayColor = Colors.grey.withOpacity(0.05);

const InputDecoration inputDecoration = InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  labelStyle: TextStyle(
    color: Colors.white,
  ),
);

const List<String> daysInWeek = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];
