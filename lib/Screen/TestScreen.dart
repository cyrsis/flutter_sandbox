import 'package:flutter/material.dart';
import 'package:flutter_sandbox/CustomerPainter/RadialProgressPainter.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => new _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  var percent =20.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Expanded(
          child: AspectRatio(
            aspectRatio: 1.0,
            child: new CustomPaint(
              painter:new  RadialProgressPainter(
                lineColor:Colors.amber,
                completeColor:Colors.blueAccent,
                completePercent:percent,
                width:8.0,
              ),
              child: new RaisedButton(
                padding: EdgeInsets.all(20.0),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                shape: new CircleBorder(),
                splashColor: Colors.blueGrey,
                child: const Text('Click me'),
                onPressed: () {
                  //todo
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
