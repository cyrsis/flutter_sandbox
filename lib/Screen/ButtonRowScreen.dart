import 'package:flutter/material.dart';

class ButtonRowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Buttons"),
      ),
      body: new Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new Container(
          child: new Text("widget ButtonBar:"),
          margin: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        ),
        new ButtonBar(children: <Widget>[
          new FlatButton(
            child: new Text("Button 1"),
            onPressed: () => debugPrint("Button 1"),
          ),
          new FlatButton(
            child: new Text("Button 2"),
            onPressed: () => debugPrint("Button 2"),
          )
        ]),
        new Container(
          child: new Text("widget ButtonBar with custom ButtomTheme:"),
          margin: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        ),
        new ButtonTheme(
          minWidth: 44.0,
          padding: new EdgeInsets.all(0.0),
          child: new ButtonBar(children: <Widget>[
            new FlatButton(
              child: new Text("Button 1"),
              onPressed: () => debugPrint("Button 1"),
            ),
            new FlatButton(
              child: new Text("Button 2"),
              onPressed: () => debugPrint("Button 2"),
            ),
          ]),
        ),
        new Container(
          child: new Text("widget Row with FlatButton:"),
          margin: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        ),
        new Row(
          children: <Widget>[
            new FlatButton(
              child: new Text("Button 1"),
              onPressed: () => debugPrint("Button 1"),
            ),
            new FlatButton(
              child: new Text("Button 2"),
              onPressed: () => debugPrint("Button 2"),
            ),
          ],
        ),
        new Container(
          child: new Text("widget Row with InkWell"),
          margin: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        ),
        new Row(
          children: <Widget>[
            new InkWell(
              child: new Text("Button 1"),
              onTap: () => debugPrint("Button 1"),
            ),
            new InkWell(
              child: new Text("Button 2"),
              onTap: () => debugPrint("Button 2"),
            ),
          ],
        )
      ]),
    );
  }
}
