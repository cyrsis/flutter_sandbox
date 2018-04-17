import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class LayOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(

      decoration: new BoxDecoration(color:Colors.white,border: new Border.all(color: Colors.blueAccent)),
      child: new Column(

        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          new Text('We move under cover and we move as one',),
          new Text('Through the night, we have one shot to live another day'),
          new Text('We cannot let a stray gunshot give us away'),
          new Text('We will fight up close, seize the moment and stay in it'),
          new Text('It’s either that or meet the business end of a bayonet'),
          new Text('The code word is ‘Rochambeau,’ dig me?'),
          new Text('Rochambeau!', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
        ],
      )
    );
  }
}
