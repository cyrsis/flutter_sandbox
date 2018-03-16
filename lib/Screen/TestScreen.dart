import 'package:flutter/material.dart' ;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestScreen extends StatelessWidget {
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
        child:
        null
      ),
    ); //End of Container
  }
}
