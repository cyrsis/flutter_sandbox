import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Util/Epson.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Text('Epson Command Testing'),
          new Text('Code  by Victor'),
          new RaisedButton(
            child: const Text('m30'),
            color: Theme.of(context).accentColor,
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            onPressed: () {
              Socket.connect("192.168.41.235", 9100).then((socket) {
                socket.write("Is this working right?   \x0A \x0A \x1B@\x1DV1");
              });

              print("Sending Command 192.168.41.235");
              // Perform some action
            },
          ),
          new RaisedButton(
            child: const Text('88V'),
            color: Theme.of(context).accentColor,
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            onPressed: () {
              var epson = new Epson("192.168.41.177", "");

              epson.QRCode();

              epson.write();

              // Perform some action
            },
          ),
          new RaisedButton(
            child: const Text('Open Drawer'),
            color: Theme.of(context).accentColor,
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            onPressed: () {
              var epson2 = new Epson("192.168.41.177", "");
              epson2.OpenDrawer();
              print('Open Drawer call');
              epson2.write();
              // Perform some action
            },
          ),
          new RaisedButton(
            child: const Text('QRcode 2 Call'),
            color: Theme.of(context).accentColor,
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            onPressed: () {
              var epson3 = new Epson("192.168.41.235", "");
              //epson3.init();
              epson3.QRCode();
              print('QRCODE Call');
              //epson3.Cut();
              epson3.write();
              // Perform some action
            },
          ),
        ],
      )),
    );
  }
}
