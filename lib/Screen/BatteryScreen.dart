import 'dart:async';

import 'package:flutter/material.dart';
import 'package:battery/battery.dart';
class BatteryScreen extends StatefulWidget {
  @override
  _BatteryScreenState createState() => new _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {

  Battery battery = new Battery();

  StreamSubscription<BatteryState> BatterySubscription;

  BatteryState batteryState;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text("Battery : $batteryState", style: new TextStyle(color: Colors.black))
      ],
    );
  }


  @override
  void dispose() {
    super.dispose();
    BatterySubscription?.cancel();
  }

  @override
  void initState() {
    BatterySubscription = battery.onBatteryStateChanged.listen((BatteryState state){
      setState(() {
        batteryState= state;
      });
    });
        
  }


}
