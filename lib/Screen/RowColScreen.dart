import 'package:flutter/material.dart';

class RowColScreen extends StatefulWidget {
  @override
  _RowColScreenState createState() => new _RowColScreenState();
}

class _RowColScreenState extends State<RowColScreen> {
  bool isRow;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;
  MainAxisSize _mainAxisSize = MainAxisSize.max;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Col/Row'),
      ),
      body: _buildRowColOption(),
    );
  }

  Widget _buildRowColOption() {
    return new Stack(
       alignment: Alignment.center,
       children: <Widget>[

         new SizedBox(
             width: 400.0,
             height:400.0,
             child: new Container( //Div
               color: Colors.green[200],
             )
         ),
         new SizedBox(
             width: 300.0,
             height:300.0,
             child: new Container( //Div
               color: Colors.red[200],
             )
         ),

         new Positioned(
           top: 20.0,
           right: 20.0,
           width: 100.0,
           height: 120.0,
           child: new Container( //Div
               color: Colors.deepOrange,
               )
         ),

       ],
    );
  }


}


