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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
          ),
      ),
      body: new Container( //Div
        child: new TextField(
          decoration: new InputDecoration(
              hintText: "请输入标题",
              hintStyle: new TextStyle(color: Colors.white70)),
        ),
      ),
    );
  }
}
