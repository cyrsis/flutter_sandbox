import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Fonts/ProfileFronts.dart';
import 'package:flutter_sandbox/Models/Profile.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class Avator extends StatelessWidget {
  final Profile profile;
  Avator(this.profile);


  final mainTextStyle = AppStyle.MainTextStyle;
  final subTextStyle = AppStyle.SubTextStyleWhite;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(
          width: 70.0, height: 60.0,
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/profile/emma-watson.jpg"),
                fit: BoxFit.cover),
            borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                  color: Colors.black26, blurRadius: 5.0, spreadRadius: 1.0),
            ],
          ),
        ),
        new Padding(padding: const EdgeInsets.only(left: 40.0)),
        new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(profile.fullName, style: mainTextStyle),
              new Text(profile.location, style: subTextStyle),
            ],
          ),
        ),
      ],
    );
  }
}

