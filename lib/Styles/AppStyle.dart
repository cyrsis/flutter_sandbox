import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Fonts/ProfileFronts.dart';
import 'package:flutter_sandbox/Styles/AppFont.dart';


class AppStyle {

  static final TextStyle SubTextStyle = const TextStyle(
  fontFamily: "Timeburner",
  fontSize: 16.0,
  color: Colors.white70,
  fontWeight: FontWeight.w700);

  static final TextStyle AppBarTextStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 36.0
  );
  static final LinearGradient AppBarGradient =
  new LinearGradient(
      colors: [
        const Color(0xFF3366FF),
        const Color(0xFF00CCFF)
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp

  );

  static final LinearGradient CustomGradient =
  new LinearGradient(
      colors: [Colors.pink, Colors.blueAccent],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(0.6, 0.0),
      stops: [0.0, 0.6],
      tileMode: TileMode.clamp
  );
  static get BlackTextStyle => new TextStyle(fontFamily: AppFrontsName.ProfileFonts,
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 20.0);

  static get MainTextStyle => new TextStyle(fontFamily: AppFrontsName.ProfileFonts,
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 20.0);

  //css : font: 900 24px Georgia
  static get greybox => new TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w900,
    fontFamily: "Georgia",
  );

  static get AllBorder => new BoxDecoration(
      border: new Border(
          top: new BorderSide(width: 1.0, color: const Color(0xff999999)),
          right:
          new BorderSide(width: 1.0, color: const Color(0xff999999)),
          bottom:
          new BorderSide(width: 1.0, color: const Color(0xff999999)),
          left: new BorderSide(
              width: 1.0, color: const Color(0xff999999))));






}