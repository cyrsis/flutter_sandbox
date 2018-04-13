import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_sandbox/Styles/AppImage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  startTime() async {
    return new Timer(new Duration(seconds: 2), (){Navigator.of(context).pushReplacementNamed('/mainTab');});
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xFFDEA183),
      body: new Center(

        child: new Image.asset(AppImage.applogo),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
        startTime();

  }
}
