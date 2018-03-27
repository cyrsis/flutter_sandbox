import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Widgets/FourCards.dart';
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
      new Column(
          children: [
        new Image.asset(AppImage.uncover_title),
        new Padding(
          padding: const EdgeInsets.only(top: 40.0),

        ),
         new FourCards()
      ]),



    ]);
  }
}
