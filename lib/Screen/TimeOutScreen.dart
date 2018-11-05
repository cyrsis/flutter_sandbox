import 'package:flutter/material.dart';
import 'dart:async';

class TimeOutScreen extends StatefulWidget {
  @override
  _TimeOutScreenState createState() => new _TimeOutScreenState();
}

class _TimeOutScreenState extends State<TimeOutScreen> {
  static Duration duration = new Duration(milliseconds: 100);
  Timer timer;
  double _value = 0.0;
  bool _active = false;

  @override
  void initState() {
    timer = new Timer.periodic(duration, _timeout);
  }

  void _timeout(Timer timer) {
    if (!_active) return;
    setState(() {
      _value = _value + 0.01;
      if (_value == 1.0) _active = false;
    });
  }

  void _onPressed() {
    setState(() {
      _value = 0.0;
      _active = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Start Timer with \n Progress Bar'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new LinearProgressIndicator(
                    value: _value,
                    backgroundColor: Colors.white,
                  ),
                ),
                new RaisedButton(
                  onPressed: _onPressed,
                  child: new Text('Start'),
                )
              ],
            ),
          )),
    );
  }
}
