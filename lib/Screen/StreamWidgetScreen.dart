import 'dart:async';
import 'package:flutter/material.dart';

class StreamWidgetScreen extends StatefulWidget {
  StreamWidgetScreen({Key key}) : super(key: key);

  @override
  _StreamWidgetScreenState createState() => new _StreamWidgetScreenState();
}

class _StreamWidgetScreenState extends State<StreamWidgetScreen> {
  final StreamController _streamController = new StreamController<int>();
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("Stream Version Counter")),
      body: new StreamBuilder<int>(
          stream: _streamController.stream,
          initialData: _counter,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('You hit me: ${snapshot.data} times');
          }),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _streamController.sink.add(++_counter),
        backgroundColor: Colors.lightGreen,
        tooltip: '+',
        child: new Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
//Explanation and comments:
//
//Lines #24-30: we are listening to a the stream, and each time a new value goes out this stream, we update the Text with that value;
//Line #35: when we hit the FloatingActionButton, we increment the counter and send it to the Stream, via the sink; the fact of injecting a value in the stream causes the StreamBuilder that listens to it to rebuild and “refresh” the counter;
//We no longer need the notion of State, everything is taken on board via the Stream;
//This is a big improvement since the fact of calling the setState() method, forces the whole Widget (and any sub widgets) to rebuild. Here, ONLY the StreamBuilder is rebuilt (and of course its children widgets);
//The only reason why we are still using a StatefulWidget for the page, is simply because we need to release the StreamController, via the dispose method, line #15;


//-------- BloC Pattern-------
//In short, the Business Logic needs to:
//
//be moved to one or several BLoC s,
//    be removed as much as possible from the Presentation Layer. In other words, UI components should only worry about the UI things and not about the business,
//    rely on exclusive use of Streams for both input (Sink) and output (stream),
//remain platform independent,
//remain environment independent.
