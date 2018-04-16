import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
          children: <Widget>[
            new Container(
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
                new Opacity(
                    opacity: 0.7,
                    child: new Text("Design by Luca")
                ), //End of Opac
                new Opacity(
                    opacity: 0.7,
                    child: new Text("Coded by Victor")
                ), //End of Opac

              ],
            )
          )
          ]
      ),
    ); //End of Container
  }
}
