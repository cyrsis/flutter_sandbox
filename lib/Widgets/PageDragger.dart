import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/SlideUpdate.dart';

class PageDragger extends StatefulWidget {
  final bool canDragLeftToRight;
  final bool canDragRightToLeft;
  final StreamController<SlideUpdate> slideUpdateStream;

  const PageDragger({Key key, this.canDragLeftToRight, this.canDragRightToLeft, this.slideUpdateStream}) : super(key: key);

  @override
  _PageDraggerState createState() => new _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {

   static const FULL_TRANSACTION_PX =300.0;



  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
    );
  }

  void _onDragStart(DragStartDetails details) {
  }

  void _onDragUpdate(DragUpdateDetails details) {
  }

  void _onDragEnd(DragEndDetails details) {
  }
}
