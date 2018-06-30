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
          color:widget.positiveColor,
          paddingTop:50.0,
          paddingBottom:50.0,
          paddingRight:20.0,

        )
      ],
    );
  }
}

