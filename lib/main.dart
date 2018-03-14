import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sandbox/Screen/AboutScreen.dart';
import 'package:flutter_sandbox/Screen/ExploreScreen.dart';
import 'package:flutter_sandbox/Screen/HomeScreen.dart';
import 'package:flutter_sandbox/Screen/UncoverScreen.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:math' as math;

void main() =>
    runApp(new MaterialApp(
      title: "Shunga",
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: new mainTab(),
    ));

class mainTab extends StatefulWidget {
  @override
  _mainTabState createState() => new _mainTabState();
}

class _mainTabState extends State<mainTab> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      // Prevent swipe popping of this page. Use explicit exit buttons only.
        onWillPop: () => new Future<bool>.value(true),

        child: new CupertinoTabScaffold(
          tabBar: new CupertinoTabBar(
            backgroundColor: Colors.transparent,
              activeColor: const Color(0xFF615147),
              inactiveColor:const Color(0xFF918984),

            items: const <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.info),
                //icon: const IconData(0xe901, fontFamily: 'icomoon'),
                title: const Text('Home'),
              ),
              const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.info),
                title: const Text('Explore'),
              ),
              const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.profile_circled),
                title: const Text('Uncover'),
              ),
              const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.ellipsis),
                title: const Text('About'),
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return new DefaultTextStyle(
              style: const TextStyle(
                fontFamily: '.SF UI Text',
                fontSize: 17.0,
                color: CupertinoColors.black,

              ),
              child: new CupertinoTabView(
                builder: (BuildContext context) {
                  switch (index) {
                    case 0:
                      return new HomeScreen();
                      break;
                    case 1:
                      return new ExploreScreen();
                      break;
                    case 2:
                      return new UncoverScreen();
                      break;
                    case 3:
                      return new AboutScreen();
                      break;
                    default:
                  }
                },
              ), //End of Child
            );
          },
        )
    ); //End of IOSTab

  }

}


class MyApp extends StatelessWidget {
  //Root
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Come on , this is fast?',
            ),
            new Text(
              'This is a greate app experience',
            ),
            new Text(
              'This is working well?',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
            new Container(
              constraints: new BoxConstraints.expand(
                height: Theme
                    .of(context)
                    .textTheme
                    .display1
                    .fontSize * 1.1 + 200.0,
              ),
              padding: const EdgeInsets.all(8.0),
              color: Colors.teal.shade700,
              alignment: Alignment.center,
              child: new Text('Hello World', style: Theme
                  .of(context)
                  .textTheme
                  .display1
                  .copyWith(color: Colors.white)),
              foregroundDecoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new NetworkImage(
                      'https://www.example.com/images/frame.png'),
                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                ),
              ),
              transform: new Matrix4.rotationZ(0.2),
            ),

            new Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
          ],
        ),
      ),


    );
  }
}
