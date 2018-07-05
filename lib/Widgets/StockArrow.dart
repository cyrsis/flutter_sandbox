import 'package:flutter/material.dart';
import 'package:flutter_sandbox/CustomerPainter/StockArrow.dart';

import 'dart:math' as math;

class StockArrow extends StatelessWidget {

  StockArrow({ Key key, this.percentChange }) : super(key: key);

  final double percentChange;

  int _colorIndexForPercentChange(double percentChange) {
    const double maxPercent = 10.0;
    final double normalizedPercentChange = math.min(percentChange.abs(), maxPercent) / maxPercent;
    return 100 + (normalizedPercentChange * 8.0).floor() * 100;
  }

  Color _colorForPercentChange(double percentChange) {
    if (percentChange > 0)
      return Colors.green[_colorIndexForPercentChange(percentChange)];
    return Colors.red[_colorIndexForPercentChange(percentChange)];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 25.0,
        height: 25.0,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: new CustomPaint(
            painter: new StockArrowPainter(
              // TODO(jackson): This should change colors with the theme
                color: _colorForPercentChange(percentChange),
                percentChange: percentChange
            )
        )
    );
  }
}