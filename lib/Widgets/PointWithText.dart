import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class   PointWithText extends StatelessWidget {
  Color color;

  bool isAboveSlider;

  var points;

  bool isPointsYouNeed;

  PointWithText(
      {this.points,
        bool this.isAboveSlider = true,
        bool this.isPointsYouNeed = true,
        Color this.color});

  @override
  Widget build(BuildContext context) {
    var percent = points / 100;
//    var PointSize = 30.0 + (70.0 * percent);
    var PointSize = ui.lerpDouble(30.0, 100.0, percent);
    return new Row(
      crossAxisAlignment:
      isAboveSlider ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        FractionalTranslation(
          translation: new Offset(0.0, isAboveSlider ? 0.18 : -0.18),
          child: new Text(
            '${points}',
            style: new TextStyle(
              fontSize: PointSize,
              letterSpacing: 2.0,
              color: color,
            ),
          ),
        ),
        new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: new Text('POINTS', style: AppStyle.Bold(color)),
            ),
            new Text(isPointsYouNeed ? "YOU NEED" : "YOU HAVE",
                style: AppStyle.Bold(color)),
          ],
        ),
      ],
    );
  }
}