import 'dart:math' as math;

import 'package:flutter/material.dart';

class StockArrowPainter extends CustomPainter {
  StockArrowPainter({ this.color, this.percentChange });

  final Color color;
  final double percentChange;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = new Paint()..color = color;
    paint.strokeWidth = 1.0;
    const double padding = 2.0;
    assert(padding > paint.strokeWidth / 2.0); // make sure the circle remains inside the box
    final double r = (size.shortestSide - padding) / 2.0; // radius of the circle
    final double centerX = padding + r;
    final double centerY = padding + r;

    // Draw the arrow.
    const double w = 8.0;
    double h = 5.0;
    double arrowY;
    if (percentChange < 0.0) {
      h = -h;
      arrowY = centerX + 1.0;
    } else {
      arrowY = centerX - 1.0;
    }
    final Path path = new Path();
    path.moveTo(centerX, arrowY - h); // top of the arrow
    path.lineTo(centerX + w, arrowY + h);
    path.lineTo(centerX - w, arrowY + h);
    path.close();
    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);

    // Draw a circle that circumscribes the arrow.
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(new Offset(centerX, centerY), r, paint);
  }

  @override
  bool shouldRepaint(StockArrowPainter oldDelegate) {
    return oldDelegate.color != color
        || oldDelegate.percentChange != percentChange;
  }
}




