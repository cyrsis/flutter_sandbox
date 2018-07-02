import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Clipper/SliderClipper.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/PointWithText.dart';
import 'package:flutter_sandbox/Widgets/SlideMarker.dart';
import 'package:flutter_sandbox/Widgets/SliderGoo.dart';

class SpringSlider extends StatefulWidget {
  var markcount;

  var positiveColor;

  var negativeColor;

  SpringSlider({this.markcount, this.positiveColor, this.negativeColor});

  @override
  _SpringSliderState createState() => new _SpringSliderState();
}

class _SpringSliderState extends State<SpringSlider>
    with TickerProviderStateMixin {
  final double paddingTop = 50.0;
  final double paddingBottom = 50.0;

  var sliderPercent = 0.43;

  double startDragY;

  double startDragPercent;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: new Stack(
        children: <Widget>[
          _buildSliderWhite(),

          new ClipPath(
            clipper: new SliderClipper(
                slidepercent: sliderPercent,
                paddingTop: paddingTop,
                paddingBottom: paddingBottom),
            child: new SlideMarker(
              markcount: widget.markcount,
              markColor: widget.negativeColor,
              backgroundColor: widget.positiveColor,
              paddingTop: paddingTop,
              paddingBottom: paddingBottom,
              paddingRight: 20.0,
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
            child: new LayoutBuilder(builder: (context, constraints) {
              //const Offset wont solve the Big Small text,
              //Fraction may solve it
              //Fractiontranslation translate it child
              var height = constraints.maxHeight;

              var TopTextY = (height * (1 - sliderPercent));

              var pointYouNeed = (100 * (1.0 - sliderPercent)).round();
              var pointYouhave = 100 - pointYouNeed;

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
      ),
    );
  }

  Widget _buildSliderWhite() {
    return new SlideMarker(
      markcount: widget.markcount,
      markColor: widget.positiveColor,
      backgroundColor: widget.negativeColor,
      paddingTop: paddingTop,
      paddingBottom: paddingBottom,
      paddingRight: 20.0,
    );
  }

  void _onPanStart(DragStartDetails details) {

    startDragY = details.globalPosition.dy;
    startDragPercent= sliderPercent;

  }

  void _onPanUpdate(DragUpdateDetails details) {

    var dragDistance = startDragY = details.globalPosition.dy;
    var sliderHeight = context.size.height;
    var dragPercent = dragDistance/sliderHeight;

    setState(() {
      sliderPercent = startDragPercent + dragPercent;
    });

  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      startDragY= null;
      startDragPercent= null;
    });
  }
}

