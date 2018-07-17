import 'package:flutter/material.dart';

class OffSetDelayAnimationScreen extends StatefulWidget {
  @override
  _OffSetDelayAnimationScreenState createState() =>
      new _OffSetDelayAnimationScreenState();
}

class _OffSetDelayAnimationScreenState extends State<OffSetDelayAnimationScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _animation;

  Animation<double> _laterAnimation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2000));

    _animation = Tween(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ))
      ..addStatusListener(handlestatus);

    _laterAnimation = Tween(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.fastOutSlowIn,
        )));

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
                child: Container(
                  child: Center(
                    child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                      Transform(
                          transform:
                          Matrix4.translationValues(_animation.value*width, 0.0, 0.0),
                          child: new Center(
                              child: new Container(
                                width: 200.0,
                                color: Colors.black12,
                                height: 30.0,
                              ))),
                      Transform(
                        transform:
                        Matrix4.translationValues(_animation.value*width, 35.0, 0.0),
                        child: Center(
                            child: Container(
                              padding: EdgeInsets.only(top:16.0),
                              height: 30.0,
                              width: 200.0,
                              color: Colors.black12,
                            )),
                      ),
                      Transform(
                        transform:
                        Matrix4.translationValues(_laterAnimation.value*width, 65.0, 0.0),
                        child: new Center(
                          child: new Container(
                            padding: EdgeInsets.only(top: 16.0),
                            width: 200.0,
                            color: Colors.black12,
                            height: 30.0,
                          ),
                        ),
                      )
                    ]),
                  ),
                )),
          );
        });


  }

  void handlestatus(status) {
    if (status == AnimationStatus.completed) {
      _animation.removeStatusListener(handlestatus);
      _controller.reset();
      _animation = Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ));

      _laterAnimation = Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
          parent: _controller,
          curve: Interval(
            0.2,
            1.0,
            curve: Curves.fastOutSlowIn,
          )))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Navigator.pop(context);
          }
        });

      _controller.forward();
    }
  }
}
