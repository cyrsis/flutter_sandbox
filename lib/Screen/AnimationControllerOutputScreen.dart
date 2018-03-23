import 'package:flutter/material.dart';


class AnimationControllerOutputScreen extends StatefulWidget {
  @override
  _AnimationControllerOutputScreenState createState() =>
      new _AnimationControllerOutputScreenState();
}

class _AnimationControllerOutputScreenState extends State<AnimationControllerOutputScreen>
    with SingleTickerProviderStateMixin {

  AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 3),
    );
    animation.addListener(() {
      this.setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Center(
        child: new Text(
          animation.isAnimating
              ? animation.value.toStringAsFixed(3)
              : "Tap me!",
          style: new TextStyle(
            fontSize: 50.0,color: Colors.white
          ),
        ),
      ),
      onTap: () {
        animation.forward(from: 0.0);
      },
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }
}