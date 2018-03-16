import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppTextStyle.dart';

class CustomAppBar extends StatelessWidget {

  final String title;
  final double barHeight = 60.0;

  CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Center(
        child: new Text(title,
          style:AppStyle.AppBarTextStyle
        ),
      ),
      decoration: new BoxDecoration(
        gradient: AppStyle.AppBarGradient,
      ),
    );
  }
}