import 'dart:math';

import 'package:flutter/material.dart';

//This widget should able to review any widge under a stack

class PageReveal extends StatelessWidget {

  final double revealpercent;
  final Widget child;

  const PageReveal({Key key, this.revealpercent, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ClipOval(
      clipper: new CircleRevealClipper(revealpercent),
      child: child,

    );
  }
}

class CircleRevealClipper extends CustomClipper<Rect>{
  CircleRevealClipper(double revealpercent);

  @override
  Rect getClip(Size size) {
    final epicenter = new Offset(size.width,size.height*0.9);
    print("epcicenter ${epicenter}");
    double theta = atan(epicenter.dy/epicenter.dx);

    final distanceToCorner = epicenter.dy /sin(theta);
    
    
    

    //calculate the distance from top left corner to make sure fill the screen
  }



  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
