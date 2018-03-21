import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AppStyle {

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

}