import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Widgets/CustomTouch.dart';
import 'package:flutter_sandbox/Widgets/DropDown.dart';
import 'package:flutter_sandbox/Widgets/IOSprogressindic.dart';
import 'package:flutter_sandbox/Widgets/InkWallButton.dart';
import 'package:flutter_sandbox/Widgets/WhiteCard.dart';
import 'package:transparent_image/transparent_image.dart';
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
        child: new Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Center(
                child:
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset('assets/home/Logo.png'),
                    new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text('春 画'),
                    ),
                    new Text('Shunga'),

                  ],

                )



            ),
        )
      ),
    ); //End of Container
  }
}

