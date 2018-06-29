import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class PinkSpringScreen extends StatefulWidget {
  @override
  _PinkSpringScreenState createState() => new _PinkSpringScreenState();
}

class _PinkSpringScreenState extends State<PinkSpringScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: null),
        actions: <Widget>[
          _buildTextButton('setting'.toUpperCase(), true),
        ],
      ),
    );
  }

  _buildTextButton(String title, bool isOnLight) {
    return new FlatButton(
      padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: new Text(
        title,
        style: new TextStyle(
            color: isOnLight ? Theme.of(context).primaryColor : Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        //todo
      },
    );
  }
}
