import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/Profile.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/Avatar.dart';
import 'package:flutter_sandbox/Widgets/ClipPathImage.dart';
import 'package:flutter_sandbox/Widgets/CustomAppBar.dart';
import 'package:flutter_sandbox/Widgets/DropDown.dart';
import 'package:flutter_sandbox/Widgets/ListMenu.dart';
import 'package:flutter_sandbox/Widgets/LoadJson.dart';
import 'package:flutter_sandbox/Widgets/TipCalculator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sandbox/Widgets/QuickAction.dart';
import 'package:fluttery/framing.dart';

class TestScreen extends StatelessWidget {
  final profile = getProfile();

  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/home/background.png"),
                fit: BoxFit.cover,),
            ),
          ),
          new ClipPathImage(),
          new RandomColorBlock(
            width: double.INFINITY,
            child: new Center(
              child: new Container(
                padding: const EdgeInsets.all(15.0),
                color: Colors.white,
                child: new Text(
                    'Really can be hot reload?'
                ),
              ),
            ),
          ),


          new RandomColorBlock(
            width: double.INFINITY,
            child: new AspectRatio(
              aspectRatio: 1.0,
              child: new Center(
                child: new Container(
                  padding: const EdgeInsets.all(15.0),
                  color: Colors.white,
                  child: new Text(
                      'Random colors live across hot reloads.'
                  ),
                ),
              ),
            ),
          ),
        ]
    );
  }
}
