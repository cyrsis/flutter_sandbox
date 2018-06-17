import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
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
    return new Center(
      child: new Container(
        color: Colors.black,
        child: new Transform(
          alignment: Alignment.centerLeft,
          transform: new Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
          child: new Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFFE8581C),
            child: const Text('Apartment for rent!'),
          ),
        ),
      ),
    );
  }
}



