import 'package:flutter/material.dart';

class EasingAnimationScreen extends StatefulWidget {
  @override
  _EasingAnimationScreenState createState() =>
      new _EasingAnimationScreenState();
}

class _EasingAnimationScreenState extends State<EasingAnimationScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));

    _animation = new Tween(
      begin: -1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ))
      ..addStatusListener(statusHandler);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double wide = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: new Container(
              //Div
              child: Transform(
                transform: Matrix4.translationValues(
                    _animation.value * wide, 0.0, 0.0),
                child: new Center(
                    child: new Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.black12,
                )),
              ),
            ),
          );
        });
  }

  void statusHandler(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _animation.removeStatusListener(statusHandler);
      _controller.reset();
      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Navigator.pop(context);
          }
        });
      _controller.forward();
    }
  }
}
