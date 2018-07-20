import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Clipper/BottomWaveClipper.dart';
import 'package:flutter_sandbox/Screen/LocationShare/Roundedbutton.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _dateSelected = '';

  double _value1 = 0.0;

  TextEditingController _controller= new TextEditingController();

  void _BuildBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            //Div
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new RoundedButton(
                  buttonName: 'Sign-In',
                  onTap: _handleSubmitted,
                  width: screenSize.width,
                  height: 50.0,
                  bottomMargin: 10.0,
                  borderWidth: 0.0,
                  buttonColor: const Color.fromRGBO(100, 100, 100, 1.0),
                ),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: "请输入标题",
                      hintStyle: new TextStyle(color: Colors.black),
                      icon: new Icon(Icons.people),

                  ),
                  autocorrect: true,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  onChanged: _textonChange,
                  onSubmitted: _textSubmitted,

                ),
                new Text(
                  'Some infor here',
                  style: new TextStyle(
                      color: Colors.black26,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: const Text('Close'),
                    color: Theme.of(context).accentColor,
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    onPressed: () {
                      Navigator.pop(context);
                      // Perform some action
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future _BuildAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text(message),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: new Text('OK'),
            ),
          ],
        ));
  }

  void _BuildSnackBar() {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text("Hello Snackbar")));
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
    var screenSize = MediaQuery
        .of(context)
        .size;
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(elevation: 0.0, backgroundColor: Colors.transparent),
        body: new Container(
            //Div
            child: Column(
          children: [
            new RoundedButton(
              buttonName: 'Sign-In',
              onTap: _handleSubmitted,
              width: screenSize.width,
              height: 50.0,
              bottomMargin: 10.0,
              borderWidth: 0.0,
              buttonColor: const Color.fromRGBO(100, 100, 100, 1.0),
            ),

            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "请输入标题",
                hintStyle: new TextStyle(color: Colors.black),
                icon: new Icon(Icons.people),
              ),
              autocorrect: true,
              autofocus: true,
              keyboardType: TextInputType.text,
              onChanged: _textonChange,
              onSubmitted: _textSubmitted,
            ),

            new RaisedButton(
              child: const Text('hit me'),
              color: Theme
                  .of(context)
                  .accentColor,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                print("Controller values ${_controller.text}");
                // Perform some action
              },
            ),
          ],
        )));
  }

  void _set2(var value) {
    setState(() {
      _value1 = value;
    });
  }

  void _textonChange(String value) {
    print(" The test is ${_controller.text}");
  }

  void _textSubmitted(String value) {
    print(" The test is ${_controller.text}");
  }

  void _handleSubmitted() {
  }
}
