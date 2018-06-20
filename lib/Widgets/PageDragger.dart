import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/SlideDirection.dart';
import 'package:flutter_sandbox/Models/SlideUpdate.dart';

class PageDragger extends StatefulWidget {
  final bool canDragLeftToRight;
  final bool canDragRightToLeft;
  final StreamController<SlideUpdate> slideUpdateStream;

  const PageDragger(
      {Key key,
      this.canDragLeftToRight,
      this.canDragRightToLeft,
      this.slideUpdateStream})
      : super(key: key);

  @override
  _PageDraggerState createState() => new _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {

  static const FULL_TRANSACTION_PX = 300.0;

  Offset dragStart;

  SlideDirection slideDirection;

  double slidePercent;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
    );
  }

  void _onDragStart(DragStartDetails details) {
    dragStart = details.globalPosition;

    //print("Global Postiion ${dragStart}");
  }

  //Trying to figure out the logic for drag left or drag right
  void _onDragUpdate(DragUpdateDetails details) {
    if (dragStart != null) {
      final newPosition = details.globalPosition;
      final dx = dragStart.dx - newPosition.dx;
      if (dx > 0.0 ) {
        slideDirection = SlideDirection.rightToLeft;
      } else if (dx<0.0  ) {
        slideDirection = SlideDirection.lefToRight;
      } else {
        slideDirection= SlideDirection.none;
      }

      slidePercent = (dx/FULL_TRANSACTION_PX).abs().clamp(0.0, 1.0);
      print("Slide ${slideDirection} SlidePercet ${slidePercent}");
    }
  }

  void _onDragEnd(DragEndDetails details) {

    dragStart = null;

  }
}
