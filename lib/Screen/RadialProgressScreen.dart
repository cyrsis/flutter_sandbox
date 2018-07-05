import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/CustomerPainter/RadialProgressPainter.dart';

class RadialProgressScreen extends StatefulWidget {
  @override
  _RadialProgressScreenState createState() => new _RadialProgressScreenState();
}

class _RadialProgressScreenState extends State<RadialProgressScreen>
    with SingleTickerProviderStateMixin {
  AnimationController percentAnimationController;

  var newPercecentage = 0.0;

  double percent = 30.0;

  @override
  void initState() {
    super.initState();
    percentAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1200))
      ..addListener(() {
        setState(() {
          percent = ui.lerpDouble(
              percent, newPercecentage, percentAnimationController.value);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    percentAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          new Expanded(
              child: new AspectRatio(
            aspectRatio: 1.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: new CustomPaint(
                painter: new RadialProgressPainter(completePercent: percent),
                child: new RaisedButton(
                  color: Colors.teal,
                  shape: new CircleBorder(),
                  child: const Text('Click Me'),
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  onPressed: () {
                    setState(() {
                      percent = newPercecentage;
                      newPercecentage += 10;
                      if (newPercecentage > 100.0) {
                        percent = 0.0;
                        newPercecentage = 0.0;
                      }

                      percentAnimationController.forward(from: 0.0);
                    });
                  },
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
