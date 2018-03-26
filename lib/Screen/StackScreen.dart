import 'package:flutter/material.dart';
class StackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('层叠定位布局'),
      ),
      body:new Center(
        child: new Stack(
            children: <Widget>[
              new Image.network('http://img2.cxtuku.com/00/13/12/s97783873391.jpg'),
              new Positioned(
                left: 35.0,
                right: 35.0,
                top: 45.0,
                child: new Text(
                  'Whatever is worth doing is worth doing well. ๑•ิ.•ั๑',
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'serif',
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
