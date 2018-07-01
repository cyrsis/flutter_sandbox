import 'dart:math';
import 'dart:ui' as ui;

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

  var sliderY = 1.0;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        _buildSliderWhite(),
        new ClipPath(
          clipper: new SliderClipper(
            slidepercent:sliderY,
            paddingTop:paddingTop,
            paddingBottom:paddingBottom
          ),
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

            var pointYouNeed =50;
            var pointYouhave = 100- pointYouNeed ;

            return new Stack(
              children: <Widget>[
                //-------- PointYouNeed -------
                new Positioned(
                  left: 30.0,
                  top: TopTextY - 50,
                  child: FractionalTranslation(
                      translation: new Offset(0.0, -1.0),
                      child: new PointWithText(
                        points: pointYouNeed,
                        color: Theme.of(context).primaryColor,
                      )),
                ),

                //-------- PointYouHave -------
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
  Color color;

  bool isAboveSlider;

  var points;

  bool isPointsYouNeed;

  PointWithText(
      {this.points,
      bool this.isAboveSlider = true,
      bool this.isPointsYouNeed = true,
      Color this.color});

  @override
  Widget build(BuildContext context) {
    var percent = points / 100;
//    var PointSize = 30.0 + (70.0 * percent);
    var PointSize = ui.lerpDouble(30.0, 100.0, percent);
    return new Row(
      crossAxisAlignment: isAboveSlider
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: <Widget>[
        FractionalTranslation(
          translation: new Offset(0.0, isAboveSlider?0.18:-0.18),
          child: new Text(
            '${points}',
            style: new TextStyle(
              fontSize: PointSize,
              letterSpacing: 2.0,
              color: color,
            ),
          ),
        ),
        new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: new Text('POINTS', style: AppStyle.Bold(color)),
            ),
            new Text(isPointsYouNeed ? "YOU NEED" : "YOU HAVE",
                style: AppStyle.Bold(color)),
          ],
        ),
      ],
    );
  }
}
