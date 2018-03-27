import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class CallMe extends StatelessWidget {
  CallMe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      new Container(
    child: new Center(
      child: new FlatButton(
          onPressed: () => launch("tel://21213123123"),
          child: new Text("Call me",style: AppStyle.MainTextStyle)),
    ),
  );
}