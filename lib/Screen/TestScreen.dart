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
  String _dateSelected ='';

  double _value1 = 0.0;

  var _controller;

  Widget _BuildRadioButtonList(){
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
      body: new Container(
        //Div
        child: Column(
          children: [
            

            new Text(
              "${(_value1*100).round()}",
              style: new TextStyle(
                fontSize: 24.0,
                letterSpacing: 2.0,
              ),
            ),
            Slider(value: _value1.toDouble(), onChanged: _set2),

            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: "请输入标题",
                  hintStyle: new TextStyle(color: Colors.black),
                  icon: new Icon(Icons.people)
              ),
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.text,
              onChanged: _textonChange,
              onSubmitted: _textSubmitted,
            ),
            _BuildRadioButtonList(),
          ],
        ),
      ),
    );
  }



  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2019));

    if (picked != null) {
      setState(() {
        _dateSelected = picked.toString();
      });
    }
  }

  void _set2(var value) {
    setState(() {
         _value1= value;
    });
  }

  void _textonChange(String value) {


  }

  void _textSubmitted(String value) {
  }
}
