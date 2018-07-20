import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;



class ExpandedListViewBuilderScreen extends StatefulWidget {
  ExpandedListViewBuilderScreen({Key key}) : super(key: key);

  @override
  _ExpandedListViewBuilderScreenState createState() =>
      new _ExpandedListViewBuilderScreenState();
}

class _ExpandedListViewBuilderScreenState
    extends State<ExpandedListViewBuilderScreen> {
  Map _countries = new Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: Text("Scallable ListviewBuilder"),
          elevation: 0.0,
          backgroundColor: Colors.transparent),
      body: Container(
        //Div
        child: Center(
          child: new Column(children: <Widget>[
            new Text('Countries'),
            new Expanded(
              child: new ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: _countries.length,
                itemBuilder: (BuildContext context, int index) {
//                  var key = _countries.keys.elementAt(index);
                var key = _countries.keys.elementAt(index);
                  return new Row(
                    children: <Widget>[
                      Padding (
                        padding: const EdgeInsets.only(left: 3.0,right: 3.0),
                        child: new Text('${key} :'),
                      ),
                      new Text('${_countries[key]}'),
                    ],
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<String> getJSONData() async {
    var response =
        await http.get(Uri.encodeFull("http://country.io/names.json"),
            // Only accept JSON response
            headers: {"Accept": "application/json"});

    // Logs the response body to the console
    print(response.body);

    // To modify the state of the app, use this method
    setState(() {
      // Get the JSON data
      _countries = json.decode(response.body);
      // Extract the required part and assign it to the global variable named data
//      data = dataConvertedToJSON['results'];

      print(_countries);
    });
    return "Successfull";
  }
}
