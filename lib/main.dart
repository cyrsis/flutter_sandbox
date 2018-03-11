import 'package:flutter/material.dart';

void main() => runApp(new MyApp());


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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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

        
        floatingActionButton: new FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: new Icon(Icons.add_a_photo)
        )
    );
  }
}
