import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/SlideUpdate.dart';

class PageDragger extends StatefulWidget {
  final bool canDragLeftToRight;
  final bool canDragRightToLeft;
  final StreamController<SlideUpdate> slideUpdateStream;

  @override
  _PageDraggerState createState() => new _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {

   static const FULL_TRANSACTION_PX =300.0;

   

  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}
