import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class CustomeSliderScreen extends StatefulWidget {
  @override
  _CustomeSliderScreenState createState() => new _CustomeSliderScreenState();
}

class _CustomeSliderScreenState extends State<CustomeSliderScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  var percent = 0.0;

  double initPosition;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Text('${percent.round().toString() + "%"}',
            style: AppStyle.CustomSliderText),
        new GestureDetector(
           onPanStart: _onPanStart ,
           onPanUpdate: _onPanUpdate,
          onPanEnd: _onPanEnd,
          child: new SliderRender(
            percent: percent,
            positiveColor: Color(0xFFEF0078),
            negativeColor: Color(0xFFFFFFFF),
          ),
        ),
      ],
    );
  }

  void _onPanStart(DragStartDetails details) {

    initPosition = details.globalPosition.dx;
  }

  void _onPanUpdate(DragUpdateDetails details) {

    setState(() {
      percent= (percent+ initPosition/200.0).clamp(0.0, 100.0);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    initPosition = null;
    
  }
}

class SliderRender extends StatelessWidget {
  var totalwidth = 200.0;

  Color positiveColor;

  var percent;

  Color negativeColor;

  SliderRender(
      {this.percent, Color this.positiveColor, Color this.negativeColor});

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: totalwidth+ 6.0,
        height: 30.0,
        decoration: new BoxDecoration(
          color: negativeColor,
          border: new Border.all(
            width: 3.0,

          ),
        ),
          child: new Row(
            children: <Widget>[
              new Container( //Div
                width: (percent/100)*totalwidth,
                color: positiveColor,
              )

            ],
          ),
    );
  }
}
