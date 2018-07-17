import 'package:flutter/material.dart';

class ParentAnimationScreen extends StatefulWidget {
  @override
  _ParentAnimationScreenState createState() =>
      new _ParentAnimationScreenState();
}

class _ParentAnimationScreenState extends State<ParentAnimationScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _growingAnimation;

  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1200));

    _growingAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _animation = Tween(
      begin: -0.25,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          Navigator.pop(context);
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    _controller.forward();

    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: Align(
              alignment: Alignment.center,
              child: new Container(
                //Div
                child: new Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Transform(
                        transform: Matrix4.translationValues(
                            _animation.value * width, 0.0, 0.0),
                        child: new Center(
                            child: AnimatedBuilder(
                                animation: _growingAnimation,
                                builder: (BuildContext context, Widget child) {
                                  return Scaffold(
                                    body: Center(
                                      child: Container(
                                        height: _growingAnimation.value,
                                        width: _growingAnimation.value,
                                        color: Colors.black12,
                                      ),
                                    ),
                                  );
                                })),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                            _animation.value * width, 0.0, 0.0),
                        child: new Center(
                          child: new Container(
                            padding: EdgeInsets.only(top: 16.0),
                            width: 200.0,
                            height: 100.0,
                            color: Colors.black12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
    ;
  }
}
