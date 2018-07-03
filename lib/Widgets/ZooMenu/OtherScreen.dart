import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Widgets/ZooMenu/ZoomScaffold.dart';


final otherScreen = new Screen(
  title: 'OTHER SCREEN',
  background: new DecorationImage(
    image: new AssetImage(AppImage.other_screen_bk),
    fit: BoxFit.cover,
    colorFilter: new ColorFilter.mode(const Color(0xCC000000), BlendMode.multiply),
  ),
  contentBuilder: (BuildContext context) {
    return new Center(
      child: new Container(
        height: 300.0,
        child: new Padding(
          padding: const EdgeInsets.all(25.0),
          child: new Card(
            child: new Column(
              children: [
                new Image.asset(AppImage.other_screen_card_photot),
                new Expanded(
                  child: new Center(
                    child: new Text('This is another screen!')
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
);