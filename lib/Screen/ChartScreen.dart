import 'dart:math';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Widgets/BarChart.dart';


class ChartScreen extends StatefulWidget {
  @override
  ChartScreenState createState() => new ChartScreenState();
}

class ChartScreenState extends State<ChartScreen> with TickerProviderStateMixin {
  static const size = const Size(200.0, 100.0);
  final random = new Random();
  AnimationController animation;
  BarChartTween tween;

  @override
  void initState() {
    super.initState();
    animation = new AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    tween = new BarChartTween(
      new BarChart.empty(size),
      new BarChart.random(size, random),
    );
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      tween = new BarChartTween(
        tween.evaluate(animation),
        new BarChart.random(size, random),
      );
      animation.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new CustomPaint(
          size: size,
          painter: new BarChartPainter(tween.animate(animation)),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }
}