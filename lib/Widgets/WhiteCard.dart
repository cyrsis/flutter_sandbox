import 'package:flutter/material.dart';

class WhiteCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.transparent,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.warning, size: 128.0, color: textStyle.color),
            new Text("Here is the new Card", style: textStyle),
          ],
        ),
      ),
    );
  }
}