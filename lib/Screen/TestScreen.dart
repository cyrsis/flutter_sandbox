import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Clipper/BottomWaveClipper.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: double.infinity,
      child: new ClipPath(
        clipper: new BottomWaveClipper(),
        child: new Image.asset(
            AppImage.coffe_header,
            fit: BoxFit.cover),

      ),
    );
  }
}
