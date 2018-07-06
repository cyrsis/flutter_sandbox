import 'package:flutter/material.dart';

class CalcDisplay extends StatelessWidget {
  String expression;

  CalcDisplay(String this.expression);

  @override
  Widget build(BuildContext context) {
    return new Text('${expression}');
  }
}