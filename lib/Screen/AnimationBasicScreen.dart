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
    return new Center(
      child: new Container(
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    animation = new Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          animationController.reverse();
        else if (status == AnimationStatus.dismissed)
          animationController.forward();
      })
      ..addListener(() {
        setState(() {});
      });

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}



class LogoAnimation extends AnimatedWidget {

  LogoAnimation({Key key,Animation animation}):super(key:key,listenable:animation);


  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    
    return new FadeTransition(opacity: null);
  }
}
