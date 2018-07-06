import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Widgets/CalcDisplay.dart';

class CalculatorMyScreen extends StatefulWidget {
  CalculatorMyScreen({Key key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => new _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorMyScreen> {
  var _expression;

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        new Expanded(flex: 2, child: new CalcDisplay(_expression.toString())),
        new Divider(height: 1.0),
        new Expanded(flex: 3, child: new Container()),
      ],
    );
  }
}
