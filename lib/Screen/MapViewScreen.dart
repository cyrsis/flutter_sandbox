import 'package:flutter/material.dart';

class MapViewScreen extends StatefulWidget {
  @override
  _MapViewScreenState createState() => new _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  Uri staticMapUri;

  var staticMapProvider;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new InkWell(
        onTap: () {Navigator.pop(context);},
        child: new OverflowBox(
          maxHeight: double.infinity,
          maxWidth: double.infinity ,
          alignment: Alignment.center,
          child: new Container(
              decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/circlek/map.jpg"),
            fit: BoxFit.cover),
          )),
        ),
      ),
    );
  }
}
