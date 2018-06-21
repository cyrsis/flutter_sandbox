import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/RestaurantCard.dart';

class HiddenDrawerScreen extends StatefulWidget {
  @override
  _HiddenDrawerScreenState createState() => new _HiddenDrawerScreenState();
}

class _HiddenDrawerScreenState extends State<HiddenDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/hiddenmenu/wood_bk.jpg"),
              fit: BoxFit.cover)),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          leading: const IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: null),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: new Text(
            'THE PALEO PAPDDOCK',
            style: AppStyle.hiddendrawerTitle,
          ),
          centerTitle: true,
        ),
        body: new ListView(
          children: <Widget>[
            new RestaurantCard(),
            new RestaurantCard(),
            new RestaurantCard(),
          ],
        ),
      ),
    );
  }
}
