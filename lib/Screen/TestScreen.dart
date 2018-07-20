import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Clipper/BottomWaveClipper.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Widgets/QuickAction.dart';
import 'package:flutter_sandbox/Widgets/TimeText.dart';

class TestScreen extends StatefulWidget {
  var _first = false;

  @override
  TestScreenState createState() {
    return new TestScreenState();
  }
}

class TestScreenState extends State<TestScreen> {
  String _dateSelected = '';

  double _value1 = 0.0;

  var _controller;

  Future _BuildAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text(message),
          actions: <Widget>[
            FlatButton(onPressed: () => Navigator.pop(context), child: new Text(
                'OK'), )
          ],
        ));
  }

  Widget _BuildRadioButtonList() {
    List radioList = new List<Widget>();

    for (var i = 0; i < 3; i++) {
      radioList.add(Radio(value: i, groupValue: _value1, onChanged: _set2));
    }

    Row column = Row(children: radioList);

    return column;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(elevation: 0.0, backgroundColor: Colors.transparent),
      body: new Container(
        //Div
        child: Column(
          children: [

            new FlatButton(
              padding: new EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              child: new Text("Alert"),
              onPressed: () =>  _BuildAlert(context, "Is this good"),
            ),
          ],
        ),
      ),
    );
  }



  void _set2(var value) {
    setState(() {
      _value1 = value;
    });
  }

  void _textonChange(String value) {}

  void _textSubmitted(String value) {}
}
