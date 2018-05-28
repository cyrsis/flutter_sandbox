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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("layout"),
      ),
      body: new Container(
        margin: new EdgeInsets.only(top: 20.0),
        height: 500.0,
        padding: new EdgeInsets.only(left: 20.0, right: 20.0),
        //给最外层添加padding
        decoration: AppStyle.AllBorder,
        child: new GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 25.0), itemBuilder: (BuildContext context,int index) {
          return new GridTile(child: new Container());
        }),

      ),
    );
  }
}



