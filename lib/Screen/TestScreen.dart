import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {

  @override
  _TestScreenState createState() => new _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Coffee Shop"),
        backgroundColor: Colors.deepOrange,
        bottom: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.send)),
            new Tab(icon: new Icon(Icons.explore)),
            new Tab(icon: new Icon(Icons.search)),
            new Tab(icon: new Icon(Icons.account_box)),
          ],

        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        new BottomNavigationBarItem(
            icon: new Icon(Icons.add), title: new Text("Hey")),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.print), title: new Text("Nope")),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.call_missed), title: new Text("Hello"))
      ], onTap: (int i) => debugPrint("Hey Touched ${i}")),
    );
  }

  @override
  void initState() {
    controller = new TabController(length: 4, vsync: this);
  }


}
