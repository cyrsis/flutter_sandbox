import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/Profile.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/Avatar.dart';
import 'package:flutter_sandbox/Widgets/CallMe.dart';
import 'package:flutter_sandbox/Widgets/ClipPathImage.dart';
import 'package:flutter_sandbox/Widgets/CustomAppBar.dart';
import 'package:flutter_sandbox/Widgets/DesignCard.dart';
import 'package:flutter_sandbox/Widgets/DropDown.dart';
import 'package:flutter_sandbox/Widgets/ListMenu.dart';
import 'package:flutter_sandbox/Widgets/LoadJson.dart';
import 'package:flutter_sandbox/Widgets/TipCalculator.dart';
import 'package:flutter_sandbox/Widgets/VerticalDivider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_sandbox/Widgets/QuickAction.dart';
import 'package:fluttery/framing.dart';
import 'package:carousel/carousel.dart';

class TestScreen extends StatelessWidget {
  final profile = getProfile();

  @override
  Widget build(BuildContext context) {
    return new Container(
      // grey box
      child: new Center(
        child: new Container(
          // red box
          child: new Text(
            "Lorem ipsum dolor sit amet, consec etur",
            style: AppStyle.MainTextStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          decoration: new BoxDecoration(
            color: Colors.red[400],
          ),
          padding: new EdgeInsets.all(16.0),
        ),
      ),
      width: 320.0,
      height: 240.0,
      color: Colors.grey[300],
    );
  }
}
