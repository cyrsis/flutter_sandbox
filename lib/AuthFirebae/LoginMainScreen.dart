import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'SignUpScreen.dart';
import 'DashboardScreen.dart';


class LoginMainScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/dashboard': (BuildContext context) => new DashboardScreen(),
        '/landingpage': (BuildContext context) => new LoginMainScreen(),
        '/signup': (BuildContext context) => new SignUpScreen()
      },
    );
  }
}
