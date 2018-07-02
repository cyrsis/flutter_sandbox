import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Fonts/ProfileFronts.dart';
import 'package:flutter_sandbox/Styles/AppFont.dart';


class AppStyle {

  static final baseTextStyle = const TextStyle(
      color: Colors.white,
      fontFamily: 'arial'

  );

  final bigHeaderTextStyle = baseTextStyle.copyWith(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  final descTextStyle = baseTextStyle.copyWith(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
  );

  final footerTextStyle = baseTextStyle.copyWith(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
  );

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
  static get BlackTextStyle => new TextStyle(fontFamily: AppFrontsName.profileFonts,
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 20.0);

  static get MainTextStyle => new TextStyle(fontFamily: AppFrontsName.profileFonts,
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

  static get boldStyle => new TextStyle(fontWeight: FontWeight.bold);

  static get greyText => new TextStyle(color: Colors.grey);

  static get Black18 => new TextStyle(
      fontSize: 18.0, color: Colors.black87);

  static get Black87  => new TextStyle(
      fontSize: 18.0, color: Colors.black87);

  final TextStyle _kDaveStyle = new TextStyle(color: Colors.indigo.shade400, height: 1.8);
  final TextStyle _kHalStyle = new TextStyle(color: Colors.red.shade400, fontFamily: 'monospace');
  final TextStyle _kBold = const TextStyle(fontWeight: FontWeight.bold);
  final TextStyle _kUnderline = const TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: const Color(0xFF000000),
      decorationStyle: TextDecorationStyle.wavy
  );

  static get MaterialPageTitleText  => new TextStyle(color: Colors.white, fontFamily: "FlamantaRoma", fontSize: 34.0);

  static get BodyStyle   =>
      new TextStyle(color: Colors.white, fontSize: 18.0);

  static get hiddendrawerTitle  =>
      new TextStyle( fontFamily: "bebas-neue", fontSize: 23.0);

  static get RestaruantCardTitle =>
      new TextStyle(color: Colors.black26, fontFamily: "mermaid", fontSize: 22.0);

  static get RestaruantCardNumOfHeart => Black87;


  static get RestaruantCardSubTitle =>
      new TextStyle(color: Color(0xFFAAAAAA), fontFamily: "bebas-neue", fontSize: 16.0,letterSpacing: 1.0);

  static get PinkTxt =>
      new TextStyle(color: Colors.pinkAccent, fontSize: 10.0,letterSpacing: 1.0);

  static get WeatherTheme  => new ThemeData(
    primarySwatch: Colors.blue,
  );

  static Bold(Color color) {
    return TextStyle(fontWeight: FontWeight.bold,color: color)  ;
  }





}