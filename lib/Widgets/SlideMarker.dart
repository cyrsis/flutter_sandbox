import 'dart:ui';

import 'package:flutter/material.dart';

class SlideMarker extends StatelessWidget {
  double paddingTop;

  var markcount;

  var markColor;

  double paddingBottom;

  var paddingRight;

  var backgroundColor;

  SlideMarker(
      {this.markcount,
      this.markColor,
      double this.paddingTop,
      double this.paddingBottom,
      this.paddingRight,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return new CustomPaint(
      painter: new SlideMarksPainter(
        markcount: markcount,
        markcolor: markColor,
        backgroundColor: backgroundColor,
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

  var markcolor;

  final Paint markPaint;

  double markTickness;

  var paddingRight;

  var backgroundColor;
  var backgroundPaint;

  SlideMarksPainter(
      {this.markcount,
      this.markcolor,
      double this.markTickness,
      this.paddingTop,
      this.paddingBottom,
      this.paddingRight,
      this.backgroundColor})
      : markPaint = new Paint()
          ..color = markcolor
          ..strokeWidth = markTickness
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round,
        backgroundPaint = new Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.fill; //Not hardish

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height), backgroundPaint);
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
      canvas.drawLine(Offset(size.width - paddingRight - markwidth, markY),
          Offset(size.width - paddingRight, markY), markPaint);
    }
  }

  bool shouldRepaint(SlideMarksPainter oldDelegate) => true;
}
