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

class TestScreen extends StatelessWidget {
  final profile = getProfile();

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Padding(
        padding: const EdgeInsets.only(top: 100.0),
      ),
      new Text('Whatever', softWrap: true, style: AppStyle.AppBarTextStyle),
      new Container(
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            new Text(
              'Babe',
              style: AppStyle.AppBarTextStyle,
            ),
            new Text(
              'I miss you',
              style: AppStyle.AppBarTextStyle,
            ),
            new FloatingActionButton(
              onPressed: () => Navigator.of(context).pushNamed('/webview'),
              tooltip: 'Increment',
              child: new Icon(Icons.add),
            )
          ]))
    ]);
  }
}
