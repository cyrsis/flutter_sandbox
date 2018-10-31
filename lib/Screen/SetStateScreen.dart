import 'package:flutter/material.dart';


class SetStateScreen extends StatefulWidget {
  @override
  _SetStateScreenState createState() => new _SetStateScreenState();
}

class _SetStateScreenState extends State<SetStateScreen> {

  String _value = 'Nothing Yet';

  void _onPressed() => setState(() => _value = new DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Set the State for th App'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(_value),
                new IconButton(
                  icon: new Icon(Icons.timer),
                  onPressed: _onPressed,
                  tooltip: 'Click me',
                )
              ],
            ),
          )
      ),
    );
  }
}
