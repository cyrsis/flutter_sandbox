import 'dart:io';

import 'package:flutter/material.dart';

class EpsonPosScreen extends StatefulWidget {
  @override
  EpsonPosScreenState createState() {
    return new EpsonPosScreenState();
  }


}

class EpsonPosScreenState extends State<EpsonPosScreen> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              new Text('Epson Command Testing'),
              new Text('Code  by Victor'),
              new Padding(
                padding: const EdgeInsets.all(20.0),
              ),
              new RaisedButton(
                child: const Text('m30'),
                color: Theme
                    .of(context)
                    .accentColor,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  Socket.connect("192.168.41.235", 9100 ).then((socket) {
                    socket.write("Is this working right?   \x0A \x0A \x1B@\x1DV1");
                  });


                  print("Sending Command 192.168.41.235");
                  // Perform some action
                },
              ),
              new Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: null,
              ),
              new RaisedButton(
                child: const Text('88V'),
                color: Theme
                    .of(context)
                    .accentColor,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  var epson = new Epson();
                  epson.connect();

                  // Perform some action
                },
              ),
            ],
          )
      ),

    );
  }
}

class Epson {
  void connect() {
    Socket.connect("192.168.41.177", 9100 , timeout: new Duration(seconds: 10)  ).then((socket) {
      socket.write("Is this working right? ");
      socket.write("\x0A \x0A \x1B@\x1DV1");
      socket.close();
    });
  }

}




