import 'package:flutter/material.dart';


class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
          children: <Widget>[new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/home/background.png"),
                fit: BoxFit.cover,),
            ),
          ),
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: <Widget>[
                new Text('Design by Luca'),
                new Text('Code  by Victor'),
              ],
            )
          )
          ]
      ),
    ); //End of Container
  }
}
