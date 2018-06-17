import 'package:flutter/material.dart';

class CardFlipCarouselScreen extends StatefulWidget {

  @override
  _CardFlipCarouselScreenState createState() =>
      new _CardFlipCarouselScreenState();
}

class _CardFlipCarouselScreenState extends State<CardFlipCarouselScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
      new Container( //Div
      color: Colors.green[100],
          child: null);


        ]
      )
    );
  }
}
