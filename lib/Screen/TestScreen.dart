import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => new _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with TickerProviderStateMixin {

  AnimationController _animationControllerPhrase2;
  AnimationController _animationControllerPhrase3;

  AnimationController _animationControllerPhrase1;

  Animation<double> dropDownAnimation;

  @override
  void initState() {
    super.initState();
    _animationControllerPhrase1 = new AnimationController(vsync: this ,duration: new Duration(milliseconds: 1200));

    dropDownAnimation = new Tween(begin: 0.0,end: 70.0)
        .animate(new CurvedAnimation(parent: _animationControllerPhrase1, curve: new Interval(0.3, 1.0,curve: Curves.easeOut)));





  }

  @override
  void dispose() {
    super.dispose();
    _animationControllerPhrase1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}
