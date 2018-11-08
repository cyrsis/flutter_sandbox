//import 'package:flutter/material.dart';
//import 'package:flutter_sandbox/Widgets/EggTimer/EggTimer.dart';
//import 'package:flutter_sandbox/Widgets/EggTimer/EggTimerControls.dart';
//import 'package:flutter_sandbox/Widgets/EggTimer/EggTimerDial.dart';
//import 'package:flutter_sandbox/Widgets/EggTimer/EggTimerTimeDisplay.dart';
//
//class EggTimerScreen extends StatefulWidget {
//  @override
//  _EggTimerScreenState createState() => new _EggTimerScreenState();
//}
//
//class _EggTimerScreenState extends State<EggTimerScreen> {
//  final Color GRADIENT_TOP = const Color(0xFFF5F5F5);
//  final Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);
//
//  EggTimer eggTimer;
//
//  _EggTimerScreenState() {
//    eggTimer = new EggTimer(
//      maxTime: const Duration(minutes: 35),
//      onTimerUpdate: _onTimerUpdate,
//    );
//  }
//
//  _onTimeSelected(Duration newTime) {
//    setState(() {
//      eggTimer.currentTime = newTime;
//    });
//  }
//
//  _onDialStopTurning(Duration newTime) {
//    setState(() {
//      eggTimer.currentTime = newTime;
//      eggTimer.resume();
//    });
//  }
//
//  _onTimerUpdate() {
//    setState(() {});
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: new Container(
//        decoration: new BoxDecoration(
//          gradient: new LinearGradient(
//            begin: Alignment.topCenter,
//            end: Alignment.bottomCenter,
//            colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
//          ),
//        ),
//        child: new Center(
//          child: new Column(
//            children: [
//              new EggTimerTimeDisplay(
//                eggTimerState: eggTimer.state,
//                selectionTime: eggTimer.lastStartTime,
//                countdownTime: eggTimer.currentTime,
//              ),
//              new EggTimerDial(
//                eggTimerState: eggTimer.state,
//                currentTime: eggTimer.currentTime,
//                maxTime: eggTimer.maxTime,
//                ticksPerSection: 5,
//                onTimeSelected: _onTimeSelected,
//                onDialStopTurning: _onDialStopTurning,
//              ),
//              new Expanded(child: new Container()),
//              new EggTimerControls(
//                eggTimerState: eggTimer.state,
//                onPause: () {
//                  setState(() => eggTimer.pause());
//                },
//                onResume: () {
//                  setState(() => eggTimer.resume());
//                },
//                onRestart: () {
//                  setState(() => eggTimer.restart());
//                },
//                onReset: () {
//                  setState(() => eggTimer.reset());
//                },
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
