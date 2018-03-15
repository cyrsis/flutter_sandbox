import 'package:flutter/material.dart';


class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
          children: <Widget>[new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/explore/Background.png"),
                fit: BoxFit.cover,),
            ),
          ),
          new Column(
              children: [
                new Image.asset('assets/explore/Title.png'),
                new Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Image.asset('assets/explore/TinderCard.png'),
                ),
                ]
          )
          ]
      ),
    ); //End of Container
  }
}
