import 'package:flutter/material.dart';

class LayOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: SingleChildScrollView(

        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new RichText(text:new TextSpan(text: "lorem lorem lorem 1" ),),
            new Text("lorem lorem lorem 2"),
            new Text("lorem lorem lorem 3"),
            new Text("lorem lorem lorem 4"),
            new Text("lorem lorem lorem 5 5555"),
            new Text("lorem lorem lorem 6 6666666"),
          ],
        ),
      ),
    );
  }
}
