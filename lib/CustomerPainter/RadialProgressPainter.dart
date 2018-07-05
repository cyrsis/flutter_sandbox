import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgressPainter extends CustomPainter {
  double width;

  MaterialColor lineColor;

  MaterialAccentColor completeColor;

  double completePercent;

  RadialProgressPainter(
      {MaterialColor this.lineColor = Colors.amber,
      MaterialAccentColor this.completeColor = Colors.blueAccent,
      double this.completePercent = 10.0,
      double this.width = 5.0});

  @override
  void paint(Canvas canvas, Size size) {

    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center  = new Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);
    canvas.drawCircle(
        center,
        radius,
        line
    );
    double arcAngle = 2*pi* (completePercent/100);

    canvas.drawArc(
        new Rect.fromCircle(center: center,radius: radius),
        -pi/2,
        arcAngle,
        false,
        complete
    );
  }

  bool shouldRepaint(RadialProgressPainter oldDelegate) => true;

  bool shouldRebuildSemantics(RadialProgressPainter oldDelegate) => false;
}
