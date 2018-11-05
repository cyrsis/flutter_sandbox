

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Screen/FireStoreCRUD/FireStoreScreenDashboardPag.dart';
import 'package:flutter_sandbox/Screen/FireStoreCRUD/FireStoreScreenLoginPage.dart';

class FireStoreScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new FireStoreScreenHomePage(),
      routes:<String, WidgetBuilder> {
        '/homepage' : (BuildContext context) => FireStoreScreenDashboardPage()
      },
    );
  }
}

class FireStoreScreenHomePage extends StatefulWidget {
  @override
  _FireStoreScreenHomePageState createState() => new _FireStoreScreenHomePageState();
}

class _FireStoreScreenHomePageState extends State<FireStoreScreenHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Crud sample'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: new Center(
        child: FireStoreScreenLoginPage(),
      ),
    );
  }
}
