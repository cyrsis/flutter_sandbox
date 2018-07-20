import 'dart:async';

import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  DialogScreen({Key key}) : super(key: key);

  @override
  _DialogScreenState createState() => new _DialogScreenState();
}

enum Answers { YES, NO, MAYBE }

class _DialogScreenState extends State<DialogScreen> {
  String _value = "";

  void SetValue(String value) => setState(() => _value = value);

  Future _AskUserDialog() async {
    switch (await showDialog(
        context: context,
        child: SimpleDialog(
          title: Text("Do you like Flutter"),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Yes"),
              onPressed: () {
                Navigator.pop(context, Answers.YES);
              },
            ),
            SimpleDialogOption(
              child: Text("No"),
              onPressed: () {
                Navigator.pop(context, Answers.NO);
              },
            ),
            SimpleDialogOption(
              child: Text("Yes"),
              onPressed: () {
                Navigator.pop(context, Answers.MAYBE);
              },
            ),
          ],
        ))) {
      case Answers.YES:
        SetValue('YES');
        break;
      case Answers.NO:
        SetValue('NO');
        break;
      case Answers.MAYBE:
        SetValue('MAYBE');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(elevation: 0.0, backgroundColor: Colors.transparent),
      body: Center(
        child: new Column(
          children: <Widget>[

            new Card(
                elevation: 10.0,
                child: Container(
                  width: 250.0,
                  height: 100.0,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Text(
                        '24号+2个字母间隔',
                        style: new TextStyle(
                          fontSize: 24.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],

                  ),
                )
            )
            
          ],
        ),
      ),
    );
  }
}
