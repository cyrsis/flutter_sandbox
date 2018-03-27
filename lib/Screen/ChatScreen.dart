import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => new _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> with TickerProviderStateMixin {

  final List<Msg>  messages = <Msg> [];
  final TexteditingController = new TextEditingController();
  var _is_Writing = false;

  @override
  Widget build(BuildContext context) {
    return new Column(
         children: <Widget>[

           new Flexible(
               child: new ListView.builder(
                   itemBuilder: (_ ,int index)=> messages[index]))
         ],
    );
  }
}
