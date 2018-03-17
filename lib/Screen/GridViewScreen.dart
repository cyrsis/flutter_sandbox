import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new GridView.count(
        crossAxisCount: 2,
        children: new List<Widget>.generate(16, (index) {
          return new GridTile(
            child: new Card(
                color: Colors.blue.shade200,
                child: new Center(
                  child: new Text('tile $index'),
                )
            ),
          );
        }),
      ),
    );
  }
}