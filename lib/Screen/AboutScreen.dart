import 'package:flutter/material.dart';


class AboutScreen extends StatelessWidget {
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
        child: new ImageIcon( new AssetImage("assets/TabBar/about.png"), color: null)
      ),
    ); //End of Container
  }
}
