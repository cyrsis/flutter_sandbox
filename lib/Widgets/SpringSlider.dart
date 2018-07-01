import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Clipper/SliderClipper.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
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
  final double paddingTop = 50.0;
  final double paddingBottom = 50.0;

  var sliderY = 0.5;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        _buildSliderWhite(),
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
                paddingTop: paddingTop,
                paddingBottom: paddingBottom,
                paddingRight: 20.0,
              ),
            ],
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
          child: new LayoutBuilder(builder: (context, constraints) {
            //const Offset wont solve the Big Small text,
            //Fraction may solve it
            //Fractiontranslation translate it child
            var height = constraints.maxHeight;

            var TopTextY = (height * (1 - sliderY));

            var pointYouhave;

            return new Stack(
              children: <Widget>[
                new Positioned(
                  left: 30.0,
                  top: TopTextY - 50,
                  child: FractionalTranslation(
                    translation: new Offset(0.0, -1.0),
                    child: new Text(
                      'Testing Above',
                      style: AppStyle.Black18,
                    ),
                  ),
                ),
                new Positioned(
                  left: 30.0,
                  top: TopTextY + 50,
                  child: new PointWithText(
                      points: pointYouhave,
                      isAboveSlider: false,
                      isPointsYouNeed: false,
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSliderWhite() {
    return new SlideMarker(
      markcount: widget.markcount,
      color: widget.positiveColor,
      paddingTop: paddingTop,
      paddingBottom: paddingBottom,
      paddingRight: 20.0,
    );
  }
}

class PointWithText extends StatelessWidget {
  PointWithText(
      {points, bool isAboveSlider, bool isPointsYouNeed, Color color});

  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}
