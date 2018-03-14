import 'package:flutter/material.dart' ;


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
        child: null /* add child content content here */,
      ),
    ); //End of Container
  }
}
