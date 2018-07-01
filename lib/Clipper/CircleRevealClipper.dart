import 'dart:math';

import 'package:flutter/material.dart';

class CircleRevealClipper extends CustomClipper<Rect> {
  double revealpercent;

  CircleRevealClipper(this.revealpercent);

  @override
  Rect getClip(Size size) {
    final epicenter = new Offset(size.width / 2, size.height * 0.9);

    print("epcicenter ${epicenter}");
    double theta = atan(epicenter.dy / epicenter.dx);

    final distanceToCorner =
        epicenter.dy / sin(theta); //Max size for the screen

    final radius = distanceToCorner * revealpercent;

    final diameter = 2 * radius;

    return new Rect.fromLTWH(
        epicenter.dx - radius, epicenter.dy - radius, diameter, diameter);
    //calculate the distance from top left corner to make sure fill the screen
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
