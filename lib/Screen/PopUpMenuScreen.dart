import 'package:flutter/material.dart';



class PopUpMenuScreen extends StatefulWidget {
  @override
  _PopUpMenuScreenState createState() => new _PopUpMenuScreenState();
}

enum Animals{Cat, Dog, Bird, Lizard, Fish}

class _PopUpMenuScreenState extends State<PopUpMenuScreen> {

  Animals _selected = Animals.Cat;
  String _value = 'Make a Selection';
  List _items = new List();


  @override
  void initState() {
    for(Animals animal in Animals.values) {
      _items.add(new PopupMenuItem(
        child: new Text(_getDisplay(animal),),
        value: animal,
      ));
    }
  }

  void _onSelected(Animals animal) {
    setState((){
      _selected = animal;
      _value = 'You Selected ${_getDisplay(animal)}';
    });
  }

  String _getDisplay(Animals animal) {
    int index = animal.toString().indexOf('.');
    index++;
    return animal.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Working with Popup Selection'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Row(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.all(5.0),
                  child: new Text(_value),
                ),
                new PopupMenuButton<Animals>(
                    child:  new Icon(Icons.input),
                    initialValue: Animals.Cat,
                    onSelected: _onSelected,
                    itemBuilder: (BuildContext context) {
                      return _items;
                    }
                )
              ],
            ),
          )
      ),
    );
  }


}
