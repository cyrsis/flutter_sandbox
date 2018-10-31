import 'package:flutter/material.dart';


class AddRemoveListWidgetScreen extends StatefulWidget {
  @override
  _AddRemoveListWidgetScreenState createState() => new _AddRemoveListWidgetScreenState();
}

class _AddRemoveListWidgetScreenState extends State<AddRemoveListWidgetScreen> {

  int counter = 0;
  List<Widget> _list = new List<Widget>();

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  void _onClicked() {
    Widget child = _newItem(counter);
    setState(() => _list.add(child));
  }

  Widget _newItem(int i)  {
    Key key = new Key('item_${i}');
    Container child = new Container(
      key: key,
      padding: new EdgeInsets.all(10.0),
      child: new Chip(
        label: new Text('${i} Name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _removeItem(key),
        avatar: new CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: new Text(i.toString()),
        ),
      ),
    );

    counter++;
    return child;
  }

  void _removeItem(Key key) {
    for(int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if(child.key == key) {
        setState(() => _list.removeAt(i));
        print('Removing ${key.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add Remove Widget on the Run'),
      ),
      floatingActionButton: new FloatingActionButton(onPressed: _onClicked, child: new Icon(Icons.add),),

      body: SingleChildScrollView(
        child: new Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
              child: new Column(
                children: _list,
              ),
            )
        ),
      ),
    );
  }


}
