import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Widgets/SlideMarker.dart';

class SpringSlider extends StatefulWidget {
  var markcount;

  var positiveColor;

  var negativeColor;

//  final int markcount;
//  final Color positiveColor;
//  final Color negativeColor;

  SpringSlider({this.markcount, this.positiveColor, this.negativeColor});

  @override
  _SpringSliderState createState() => new _SpringSliderState();
}

class _SpringSliderState extends State<SpringSlider>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new SlideMarker(
          markcount: widget.markcount,
          color: widget.positiveColor,
          paddingTop: 50.0,
          paddingBottom: 50.0,
          paddingRight: 20.0,
        ),
        new ClipPath(
          clipper: new SliderClipper(),
          child: new Stack(
            children: <Widget>[
              new Container(
                color: widget.positiveColor, //Div
              ),
              new SlideMarker(
                markcount: widget.markcount,
                color: widget.negativeColor,
                paddingTop: 50.0,
                paddingBottom: 50.0,
                paddingRight: 20.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SliderClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var rect = new Path();

    rect.addRect(
        new Rect.fromLTWH(0.0, size.height / 2, size.width, size.height / 2),
        );

    return rect;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}


class CircleRevealClipper extends CustomClipper<Rect> {

  double revealpercent;

  CircleRevealClipper(this.revealpercent);


  @override
  Rect getClip(Size size) {
    final epicenter = new Offset(size.width / 2, size.height * 0.9);

    print("epcicenter ${epicenter}");
    double theta = atan(epicenter.dy / epicenter.dx);

    final distanceToCorner = epicenter.dy /
        sin(theta); //Max size for the screen

    final radius = distanceToCorner * revealpercent;

    final diameter = 2 * radius;

    return new Rect.fromLTWH(
        epicenter.dx - radius, epicenter.dy - radius, diameter, diameter);
    //calculate the distance from top left corner to make sure fill the screen
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}