import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class SliderAnimationScreen extends StatefulWidget {
  SliderAnimationScreen({Key key}) : super(key: key);

  @override
  _SliderAnimationScreenState createState() =>
      new _SliderAnimationScreenState();
}

class _SliderAnimationScreenState extends State<SliderAnimationScreen> {

  double _value =0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: new Text("Working with Slider"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.send),
              onPressed: () => debugPrint("Icon Tapped!")),
          new IconButton(icon: new Icon(Icons.search), onPressed: _onPress)
        ],
      ),
      body: new Container(
        padding: EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Slider(value: _value, onChanged: _onChanged),
            new Container(
              padding: new EdgeInsets.all(32.0),
              child: new LinearProgressIndicator(
                value: _value,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
            new Container(
              padding: new EdgeInsets.all(32.0),
              child: new CircularProgressIndicator(
                value: _value,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  void _onPress() {
  }
}
