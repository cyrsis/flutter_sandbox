import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwesomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(elevation: 0.0, backgroundColor: Colors.transparent),
      body: new Icon(FontAwesomeIcons.stepBackward),
    );
  }
}
