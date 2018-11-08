import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class CloudFunctionScreen extends StatefulWidget {
  @override
  createState() => new CloudFunctionScreenState();
}

class CloudFunctionScreenState extends State<CloudFunctionScreen> {
  var _randomQuote = '-';

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Famous Quotes'),
      ),
      body: new Center(
        child: new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(_randomQuote,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24.toDouble())),
              spacer,
              spacer,
              new RaisedButton(
                onPressed: _getRandomQuote,
                child: new Text('Get a Random Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getRandomQuote() async {
    var url =
        'https://us-central1-fluttersandbox-b6dd9.cloudfunctions.net/getRandomQuote';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        var data = JSON.decode(json);
        result = data['quote'] + "\n-- " + data['person'];
      } else {
        result =
            'Error getting a random quote:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed invoking the getRandomQuote function.';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _randomQuote = result;
    });
  }
}
