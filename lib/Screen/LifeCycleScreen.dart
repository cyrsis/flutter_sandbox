import 'package:flutter/material.dart';

//Working on the the state changes
//1. with WidgetsBindingObserver
//2.

class LifeCycleScreen extends StatefulWidget {
  @override
  _LifeCycleScreenState createState() => new _LifeCycleScreenState();
}

class _LifeCycleScreenState extends State<LifeCycleScreen>
    with WidgetsBindingObserver {
  AppLifecycleState _notification;

  @override
  Widget build(BuildContext context) {
    return new OrientationBuilder(builder: (context, orientation) {
      return new Center(
        child: new Text(
          "Last Notification now: $_notification",
          style: new TextStyle(
          color: orientation == Orientation.portrait
              ? Colors.red
              : Colors.black12),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _notification = state;
      print("My Application States $_notification ");
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
