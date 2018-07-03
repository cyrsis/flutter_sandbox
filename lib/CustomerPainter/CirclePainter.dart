import 'package:flutter/material.dart';

class RadialProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = Colors.amber;
    canvas.drawCircle(new Offset(100.0, 200.0), 40.0, paint);

    Paint paintRect = new Paint();
    paintRect.color = Colors.lightBlue;
    Rect rect =
        new Rect.fromPoints(new Offset(150.0, 300.0), new Offset(300.0, 400.0));
    canvas.drawRect(rect, paintRect);
  }

  bool shouldRepaint(RadialProgressPainter oldDelegate) => true;

  bool shouldRebuildSemantics(RadialProgressPainter oldDelegate) => false;
}
