import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Clipper/BottomWaveClipper.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Widgets/QuickAction.dart';

class TestScreen extends StatefulWidget {
  var _first = false;

  @override
  TestScreenState createState() {
    return new TestScreenState();
  }
}

class TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container( //Div
        child: null,
      ),
    );
  }
}
