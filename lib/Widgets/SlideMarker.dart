import 'dart:ui';

import 'package:flutter/material.dart';

class SlideMarker extends StatelessWidget {
  double paddingTop;

  var markcount;

  var color;

  double paddingBottom;

  var paddingRight;

  SlideMarker(
      {this.markcount,
      this.color,
      double this.paddingTop,
      double this.paddingBottom, this.paddingRight});

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      painter: new SlideMarksPainter(
        markcount: markcount,
        color: color,
        markTickness: 2.0,
        paddingTop: paddingTop,
        paddingBottom: paddingBottom,
        paddingRight: paddingRight,
      ),
      child: Container(),
    );
  }
}

class SlideMarksPainter extends CustomPainter {
  final double largeMarkWidth = 30.0;
  final double smalllMarkWidth = 10.0;

  var paddingBottom;

  var markcount;

  var paddingTop;

  var color;

  final Paint markPaint;

  double markTickness;

  var paddingRight;

  SlideMarksPainter(
      {this.markcount,
      this.color,
      double this.markTickness,
      this.paddingTop,
      this.paddingBottom, this.paddingRight})
      : markPaint = new Paint()
          ..color = color
          ..strokeWidth = markTickness
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round //Not hardish

  ;

  @override
  void paint(Canvas canvas, Size size) {
    var painttotalHeight = size.height - paddingTop - paddingBottom;
    var gap = painttotalHeight / (markcount - 1);

    for (var i = 0; i < markcount; i++) {
      var markwidth = smalllMarkWidth;
      if (i == 0 || i == markcount - 1) {
        markwidth = largeMarkWidth;
      } else if (i == 1 || i == markcount - 2) {
        markwidth = lerpDouble(smalllMarkWidth, largeMarkWidth, 0.5);
      }

      final markY = i * gap + paddingTop;
      //draw a line in x start, x end,
      canvas.drawLine(
          Offset(size.width -paddingRight- markwidth, markY),
          Offset(size.width -paddingRight, markY),
          markPaint);
    }
  }

  bool shouldRepaint(SlideMarksPainter oldDelegate) => true;

}
