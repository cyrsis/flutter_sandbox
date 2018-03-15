import 'package:flutter/material.dart' ;
import 'package:flutter_sandbox/Widgets/WhiteCard.dart';


class UncoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/home/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new WhiteCard(),
      ),
    ); //End of Container
  }
}
