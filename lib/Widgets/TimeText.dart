import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeText extends StatefulWidget {
  TimeText({Key key}) : super(key: key);

  @override
  _TimeTextState createState() => new _TimeTextState();
}

class _TimeTextState extends State<TimeText> {
  String currentTime;

  @override
  void initState() {
    currentTime = DateTime.now().toString();
    updateTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(currentTime);
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _getTime() {
    return DateFormat.jms().format(DateTime.now().toLocal());
  }

  Future updateTime() async {
    while (this.mounted) {
      setState(() {
        currentTime = _getTime();
      });
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
