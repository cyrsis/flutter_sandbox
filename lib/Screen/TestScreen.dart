import 'dart:convert';
import 'dart:io';

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
    final Size statusBarHeight = MediaQuery
        .of(context)
        .size;
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            tabs: [
              new Tab(icon: new Icon(Icons.mail)),
              new Tab(icon: new Icon(Icons.contacts)),
              new Tab(icon: new Icon(Icons.info)),

            ],
          ),
          title: new Text('Sample Tabs'),
        ),
        body: new TabBarView(
          children: [
            new Icon(Icons.directions_car),
            new Icon(Icons.directions_transit),
            new Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}



