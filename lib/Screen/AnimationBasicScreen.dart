import 'package:flutter/material.dart';

class AnimationBasicScreen extends StatefulWidget {
  @override
  _AnimationBasicScreenState createState() => new _AnimationBasicScreenState();
}

class _AnimationBasicScreenState extends State<AnimationBasicScreen> with TickerProviderStateMixin {
  AnimationController animationController;



  @override
  Widget build(BuildContext context) {
    return new Container();
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(duration: new Duration(milliseconds: 20),vsync: this);
    
    animation = new Tween(begin: 0.0,end: )
  }
}
