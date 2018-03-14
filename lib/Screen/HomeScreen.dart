import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Widgets/CustomTouch.dart';
import 'package:flutter_sandbox/Widgets/IOSprogressindic.dart';
import 'package:flutter_sandbox/Widgets/InkWallButton.dart';
import 'package:flutter_sandbox/Widgets/WhiteCard.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';


class HomeScreen extends StatelessWidget {
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

