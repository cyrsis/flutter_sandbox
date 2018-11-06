import 'package:flutter/material.dart';

//pages
import 'homepage.dart';
import 'loginpage.dart';
import 'signuppage.dart';
import 'selectprofpic.dart';

void main() => runApp(new FirebaseStarter());

class FirebaseStarter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => new FirebaseStarter(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/homepage': (BuildContext context) => new HomePage(),
        '/selectpic': (BuildContext context) => new SelectprofilepicPage()
      },
    );
  }
}
