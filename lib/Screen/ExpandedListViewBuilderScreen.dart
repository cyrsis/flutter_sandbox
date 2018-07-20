import 'package:flutter/material.dart';

class ExpandedListViewBuilderScreen extends StatefulWidget {
  ExpandedListViewBuilderScreen({Key key}) : super(key: key);

  @override
  _ExpandedListViewBuilderScreenState createState() =>
      new _ExpandedListViewBuilderScreenState();
}

class _ExpandedListViewBuilderScreenState
    extends State<ExpandedListViewBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title:Text("Scallable ListviewBuilder"),elevation: 0.0, backgroundColor: Colors.transparent),
      body: Container( //Div
        child: new Column(

            children: <Widget>[

              new Text('Countryies'),


            ]
        ),
      ),
    );
  }
}
