import 'package:flutter/material.dart';

//Animation in flutter is sequence of number to animate in the
// the graphic
class AnimationBasicScreen extends StatefulWidget {
  @override
  _AnimationBasicScreenState createState() => new _AnimationBasicScreenState();
}

class _AnimationBasicScreenState extends State<AnimationBasicScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return new LogoAnimation(animation: animation);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        duration: new Duration(milliseconds: 5000), vsync: this);

    animation = new Tween(begin: 0.0, end: 200.0).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed)
          animationController.forward();
        else if (status == AnimationStatus.completed)
          animationController.reverse();
      })
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class LogoAnimation extends AnimatedWidget {
  LogoAnimation({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;

    return new Center(
      child: new Container(
          //Div
          width: animation.value,
          height: animation.value,
          child: new FlutterLogo()),
    );
  }
}
