import 'package:flutter/material.dart';

class BottomWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
     var path = new Path();

     // Draw a straight line from current point to the bottom left corner.
     path.lineTo(0.0, size.height);

     path.lineTo(100.0, 0.0);

      path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true; //May need to optimizer
  }
  
}