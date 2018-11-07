import 'package:flutter/material.dart';



class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => new _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayText = '0';
  String operand;
  double val1 = 0.0;
  double val2 = 0.0;
  double calresult = 0.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Calculator'),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
                child: new Text(
                  displayText,
                  style: new TextStyle(fontSize: 65.0),
                ),
              ),
              new Expanded(
                child: new Divider(),
              ),
              buildButtonRow('7', '8', '9', '/'),
              buildButtonRow('4', '5', '6', '*'),
              buildButtonRow('1', '2', '3', '-'),
              buildButtonRow('CL', '0', '+', '='),
            ],
          ),
        ));
  }

  getPressedValue(String pressed) {
    print(pressed);
    if (pressed == "+" || pressed == "-" || pressed == "*" || pressed == "/") {
      val1 = double.parse(displayText);
      operand = pressed;
      setState(() {
        print('nice');
        displayText = pressed;
      });
    } else if (pressed == 'CL') {
      setState(() {
        val1 = 0.0;
        val2 = 0.0;
        operand = '';
        displayText = '';
      });
    } else if (pressed == '=') {
      setState(() {
        val2 = double.parse(displayText);
        if (operand == "-") {
          calresult = val1 - val2;
          print(calresult);
        } else if (operand == "+") {
          calresult = val1 + val2;
          print(calresult);
        } else if (operand == "/") {
          calresult = val1 / val2;
          print(calresult);
        } else {
          calresult = val1 * val2;
          print(calresult);
        }
        displayText = calresult.toString();
        operand = '';
      });
    } else {
      setState(() {
        if (displayText != "+" &&
            displayText != "-" &&
            displayText != "*" &&
            displayText != "/") {
          displayText = displayText + pressed;
        } else {
          displayText = "";
          displayText = displayText + pressed;
        }
      });
    }
  }

  buildButtonRow(String first, String second, String third, String fourth) {
    return new Row(
      children: <Widget>[
        new Expanded(
            child: new OutlineButton(
              padding: EdgeInsets.all(30.0),
              child: new Text(first, style: new TextStyle(fontSize: 20.0),),
              onPressed: () {
                getPressedValue(first);
              },
              textColor: Colors.black,
            )),
        new Expanded(
            child: new OutlineButton(
              padding: EdgeInsets.all(30.0),
              child: new Text(second, style: new TextStyle(fontSize: 20.0)),
              onPressed: () {
                getPressedValue(second);
              },
              textColor: Colors.black,
            )),
        new Expanded(
            child: new OutlineButton(
              padding: EdgeInsets.all(30.0),
              child: new Text(third, style: new TextStyle(fontSize: 20.0)),
              onPressed: () {
                getPressedValue(third);
              },
              textColor: Colors.black,
            )),
        new Expanded(
            child: new OutlineButton(
              padding: EdgeInsets.all(30.0),
              child: new Text(fourth, style: new TextStyle(fontSize: 20.0)),
              onPressed: () {
                print(fourth);
                getPressedValue(fourth);
              },
              textColor: Colors.black,
            )),
      ],
    );
  }
}
