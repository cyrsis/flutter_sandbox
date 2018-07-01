import 'package:flutter/material.dart';

class SliderClipper extends CustomClipper<Path> {
  double paddingTop;

  double paddingBottom;

  double slidepercent;

  SliderClipper(
      {double this.slidepercent,
      double this.paddingTop,
      double this.paddingBottom});

  @override
  getClip(Size size) {
    var rect = new Path();

    var top = paddingTop;
    var bottom = size.height;
    var height = bottom - top;
    var percentFromBottom = 1- slidepercent;

    rect.addRect(
      new Rect.fromLTRB(
          0.0, top+(percentFromBottom*height), size.width, bottom),
    );

    return rect;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
