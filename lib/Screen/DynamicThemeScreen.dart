import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppTheme.dart';



class ThemeBloc {

  var themeController;

  ThemeBloc() : themeController = new StreamController<bool>();

  get changeTheme => themeController.sink.add;
  get darkThemeStream => themeController.stream;
}

final Themebloc = new ThemeBloc();


//Using Bloc
class DynamicThemeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Themebloc.darkThemeStream,
      initialData: false,
      builder: (context, snapshot) => MaterialApp(
          theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
          home: new DynamicThemeHome(snapshot.data)),
    );
  }
}

class DynamicThemeHome extends StatelessWidget {
  final bool darkThemeEnabled;

  DynamicThemeHome(this.darkThemeEnabled);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: Center(
        child: InkWell(
            onTap: () {
              print("Ink Well call");
              () => Themebloc.changeTheme;
            },
            child: Text("Hello World")),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Dark Theme"),
              trailing: Switch(
                value: darkThemeEnabled,
                onChanged: Themebloc.changeTheme,
              ),
            )
          ],
        ),
      ),
    );
  }
}


