import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Widgets/WhiteCard.dart';

class UncoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/uncover/background_uncover.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      new Column(children: [
        new Image.asset(AppImage.uncover_title),

        new Padding(
          padding: const EdgeInsets.only(top: 50.0,left: 10.0,right: 10.0),

          child: new Row(children: <Widget>[
            new Image.asset(AppImage.uncover_orgin_card),
            new Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Image.asset(AppImage.uncover_tecnique_card),
            ),
          ]),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 10.0,left: 10.0),
          child: new Row(children: <Widget>[
            new Image.asset(AppImage.uncover_evolution_card),
            new Image.asset(AppImage.uncover_trivia_Card),
          ]),
        ),

      ])
    ]);
  }
}
