//import 'package:flutter/material.dart';
//
//import 'package:firebase_auth/firebase_auth.dart';
//
//class DashboardScreen extends StatefulWidget {
//  @override
//  _DashboardScreenState createState() => _DashboardScreenState();
//}
//
//class _DashboardScreenState extends State<DashboardScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Dashboard'),
//          centerTitle: true,
//        ),
//        body: Center(
//          child: Container(
//            child: new Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                new Text('You are now logged in'),
//                SizedBox(
//                  height: 15.0,
//                ),
//                new OutlineButton(
//                  borderSide: BorderSide(
//                      color: Colors.red, style: BorderStyle.solid, width: 3.0),
//                  child: Text('Logout'),
//                  onPressed: () {
//                    FirebaseAuth.instance.signOut().then((action) {
//                      Navigator
//                          .of(context)
//                          .pushReplacementNamed('/landingpage');
//                    }).catchError((e) {
//                      print(e);
//                    });
//                  },
//                ),
//              ],
//            ),
//          ),
//        ));
//  }
//}
