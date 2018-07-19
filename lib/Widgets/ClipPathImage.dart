import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Clipper/BottomWaveClipper.dart';

class ClipPathImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ClipPath(
      child: new Image.asset('assets/images/coffee_header.jpeg'),
      clipper: new BottomWaveClipper(),
    );
  }
}

