import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => new _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  //todo tryout different way to mess up with BoxDecoration
  get _buildBorderRadius => new BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.all(Radius.circular(10.0)),
      color: Colors.red);

  get _buildBorderRadiusWithShadow => new BoxDecoration(
        color: Colors.red,
        borderRadius: new BorderRadius.circular(15.0),
      );

  @override
  Widget build(BuildContext context) {
    return new ListView(children: <Widget>[
      buildCard(_buildBorderRadius),
      buildCard(_buildBorderRadiusWithShadow),
      buildCard(_buildBorderRadiusWithShadow),
    ]);
  }

  Card buildCard(decoration) {
    return new Card(
        elevation: 12.0,
        child: new Column(
          children: <Widget>[
            new Image.asset('assets/hiddenmenu/eggs_in_skillet.jpg',
                width: double.infinity, height: 150.0, fit: BoxFit.cover),
            new Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: decoration,
                    //todo : Mess upe with decoreation
                    child: new Icon(Icons.fastfood, color: Colors.white),
                  ),
                ),
                new Expanded(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('Something Good',
                          style: AppStyle.RestaruantCardTitle),
                      new Text('Something else',
                          style: AppStyle.RestaruantCardSubTitle),
                    ],
                  ),
                ),
                new Container(
                  width: 2.0,
                  height: 70.0,
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white,
                      Colors.black12,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: new Column(
                    children: <Widget>[
                      new Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      new Text('55', style: AppStyle.RestaruantCardNumOfHeart),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
