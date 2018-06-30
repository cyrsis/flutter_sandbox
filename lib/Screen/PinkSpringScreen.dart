import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/SpringSlider.dart';

class PinkSpringScreen extends StatefulWidget {
  @override
  _PinkSpringScreenState createState() => new _PinkSpringScreenState();
}

class _PinkSpringScreenState extends State<PinkSpringScreen> {
  @override
  Widget build(BuildContext context) {
    return new ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: new Scaffold(
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
        body: _buildBody(),
      ),
    );
  }

  Widget _buildTextButton(String title, bool isOnLight) {
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
        //todo PressButton Onp
      },
    );
  }

  Widget _buildBody() {
    return new Column(
      children: <Widget>[
        //-------- SpingSlider -------
        new Expanded(
            child: new SpringSlider(
          markcount: 12,
          positiveColor: Theme.of(context).primaryColor,
          negativeColor: Theme.of(context).scaffoldBackgroundColor,
        )),

        //-------- Bottom Text -------
        new Container(
          color: Theme.of(context).primaryColor,
          child: new Row(
            children: <Widget>[
              _buildTextButton("more".toUpperCase(), false),
              new Expanded(child: new Container()),
              _buildTextButton("stats".toUpperCase(), false),
            ],
          ),
        )
      ],
    );
  }
}
