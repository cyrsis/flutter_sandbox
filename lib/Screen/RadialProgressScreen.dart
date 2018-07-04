import 'package:flutter/material.dart';
import 'package:flutter_sandbox/CustomerPainter/RadialProgressPainter.dart';

class RadialProgressScreen extends StatefulWidget {
  @override
  _RadialProgressScreenState createState() => new _RadialProgressScreenState();
}

class _RadialProgressScreenState extends State<RadialProgressScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  var completePercent = 30.0;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
                painter: new RadialProgressPainter(
                  completePercent: completePercent
                ),
                child: new RaisedButton(
                  color: Colors.teal,
                  shape: new CircleBorder(),
                  child: const Text('Click Me'),
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  onPressed: () {
                    setState(() {
                      completePercent +=10.0;
                      if (completePercent==100) {
                        completePercent =0.0;
                      }
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
