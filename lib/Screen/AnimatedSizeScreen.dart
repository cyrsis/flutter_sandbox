import 'package:flutter/material.dart';

class AnimatedSizeScreen extends StatefulWidget {
  @override
  AnimatedSizeScreenState createState() {
    return new AnimatedSizeScreenState();
  }
}

class AnimatedSizeScreenState extends State<AnimatedSizeScreen>
    with TickerProviderStateMixin {
  bool _resized = false;

  MaterialColor _color = Colors.blue;

  double _height = 80.0;

  double _width =80.0;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new AnimatedSize(
            curve: Curves.bounceInOut,
            child: new GestureDetector(
              onTap: () {
                setState(() {
                  if (_resized) {
                    _resized = false;
                    _color = Colors.blue;
                    _height = 80.0;
                    _width = 80.0;
                  } else {
                    _resized = true;
                    _color = Colors.blue;
                    _height = 320.0;
                    _width = 320.0;
                  }
                });
              },
              child: new Container(
                width: _width,
                height: _height,
                color: _color,
              ),
            ),
            vsync: this,
            duration: new Duration(seconds: 1),
          ),
        ],
      ),
    )
    ;
  }
}
