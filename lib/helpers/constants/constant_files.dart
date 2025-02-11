// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

Color getColor(int index) {
  var colors = [
    Colors.pink,
    Colors.blue,
    Colors.purple,
    const Color(0xff9E0000),
    const Color(0xff4A3AFF),
    const Color(0xff64007C),
    const Color(0xff6D8FBB),
    const Color(0xffC893FD),
    const Color(0xff25B9C2),
    const Color(0xff00445B),
    const Color(0xFF29005B),
    const Color(0xFF5B0000),
  ];
  return colors[index];
}
