import 'package:flutter/material.dart' ;
import 'package:flutter_sandbox/Model/Profile.dart';
import 'package:flutter_sandbox/Widgets/Avatar.dart';
import 'package:flutter_sandbox/Widgets/CustomAppBar.dart';
import 'package:flutter_sandbox/Widgets/MainMenu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sandbox/Widgets/QuickAction.dart';

class TestScreen extends StatelessWidget {

  final profile = getProfile();

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
        child: new ListView(
          children: <Widget>[
            new CustomAppBar("Great App"),
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Avator(profile),
            ),
            new QuickAction(),
            new ListMenu()

          ],
        ),
      ),
    ); //End of Container
  }
}
