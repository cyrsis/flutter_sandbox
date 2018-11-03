import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sandbox/Screen/EatIdecideScreen.dart';
import 'package:flutter_sandbox/Util/Widget_Utils.dart';

class ScanQrScreen extends StatefulWidget {
  @override
  _ScanQrScreenState createState() => new _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
            height: 900.0,
            color: Color(getColorHexFromStr('006565')),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 60.0),
              new Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: Colors.orange,
                              style: BorderStyle.solid,
                              width: 3.0))),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          Text('Scan your \nBoarding Pass to Order',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                  fontFamily: 'Timesroman',
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),

                ),
              ),

              SizedBox(height: 80.0),
              RaisedButton(
                  color: Colors.transparent,
                  splashColor: Colors.blueGrey,
                  onPressed: scan,
                  child: new Icon(Icons.filter_center_focus,size: 120.0,color: Colors.grey),
              ),
              SizedBox(height: 50.0),
              new Text('Scan & Order',style: TextStyle(
                color: Colors.grey,
                  fontSize: 40.0,
                  fontFamily: 'Timesroman',
                  fontWeight: FontWeight.w700)),
            ],
          ),


          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
            child: Text(
              barcode,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => Navigator.push(context, MaterialPageRoute(
          builder: (context) => new EatIdecideScreen()
      )));
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
