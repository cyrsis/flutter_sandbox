import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class APIScreen extends StatefulWidget {
  @override
  APIScreenState createState() => APIScreenState();
}

class APIScreenState extends State<APIScreen> {
  final String url = "https://swapi.co/api/starships";
  List data;

  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["results"];
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            new Text("Name: "),
                            new Text(data[index]["name"],
                                style: AppStyle.Black18),
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            new Text("Model: "),
                            new Text(data[index]["model"],
                                style: AppStyle.Black18
                            ),
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            new Text("Cargo Capacity: "),
                            new Text(data[index]["cargo_capacity"],
                                style: AppStyle.Black87),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }
}