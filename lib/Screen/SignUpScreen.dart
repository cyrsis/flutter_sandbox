import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => new _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _user = new TextEditingController();
  var _pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: new Text("Fancy Login"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.send),
              onPressed: () => debugPrint("Icon Tapped!")),
          new IconButton(icon: new Icon(Icons.search), onPressed: null)
        ],
      ),
      body: Container(
        //Div
        child: new Center(
            child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text('Please login'),
              new Row(

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: new Text('Usnername'),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _user,
                      decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: new TextStyle(color: Colors.black),

                      ),
                      autocorrect: true,
                      autofocus: true,
                      keyboardType: TextInputType.text,

                    ),
                  )

                ],
              ),
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: new Text('Password'),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _pass,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: new TextStyle(color: Colors.black),
                      ),
                      autocorrect: true,
                      autofocus: true,
                      obscureText: true,
                      keyboardType: TextInputType.text,

                    ),
                  )

                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                  child: const Text('Login'),
                  color: Theme
                      .of(context)
                      .accentColor,
                  elevation: 4.0,
                  splashColor: Colors.blueGrey,
                  onPressed: () {

                    // Perform some action
                  },
                ),
              ),

            ],
          ),
        )),
      ),
    );
  }
}
