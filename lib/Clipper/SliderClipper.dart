
import 'package:flutter/material.dart';

class SliderClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var rect = new Path();

    rect.addRect(
      new Rect.fromLTWH(0.0, size.height / 2, size.width, size.height / 2),
    );

    return rect;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}