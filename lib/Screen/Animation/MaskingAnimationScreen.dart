import 'package:flutter/material.dart';

class MaskingAnimationScreen extends StatefulWidget {
  @override
  _MaskingAnimationScreenState createState() =>
      new _MaskingAnimationScreenState();
}

class _MaskingAnimationScreenState extends State<MaskingAnimationScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _transitionTween;

  Animation<BorderRadius> _borderRadiusTween;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2000))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pop(context);
        }
      });

    _transitionTween = Tween(
      begin: 50.0,
      end: 200.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));

    _borderRadiusTween = BorderRadiusTween(
            begin: BorderRadius.circular(75.0), end: BorderRadius.circular(0.0))
        .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: Center(
              child: Stack(
                children: <Widget>[
                  Center(
                    child: new Container(
                      width: 200.0,
                      color: Colors.black45,
                      height: 200.0,
                    ),
                  ),
                  Center(
                    child: new Container(
                      alignment: Alignment.bottomCenter,
                      width: _transitionTween.value,
                      height: _transitionTween.value,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: _borderRadiusTween.value,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
