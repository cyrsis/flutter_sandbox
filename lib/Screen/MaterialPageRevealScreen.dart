import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/MaterialPageModel.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/MaterialPage.dart';
import 'package:flutter_sandbox/Widgets/PageReveal.dart';

final pages = [
  new MaterialPageModel(
      Color(0xFF678F04),
      'assets/materialpage/hotels.png',
      'Hotels - 0',
      'All hotels and hostels are sorted by hospitality rating',
      'assets/materialpage/key.png'),
  new MaterialPageModel(
      Color(0xFF65B0B4),
      'assets/materialpage/banks.png',
      'Banks - 1',
      'We carefully vertify all banks before adding them into the App',
      'assets/materialpage/wallet.png'),
  new MaterialPageModel(Color(0xFF9B90BC), 'assets/materialpage/stores.png',
      'Store -2 ', 'This is the body', 'null')
];

class MaterialPageRevealScreen extends StatefulWidget {
  @override
  _MaterialPageRevealScreenState createState() =>
      new _MaterialPageRevealScreenState();
}

class _MaterialPageRevealScreenState extends State<MaterialPageRevealScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(children: <Widget>[
        new MaterialPage(
          model: pages[0],
          percentVisible: 1.0,
        ),
        new PageReveal(
          child: new MaterialPage(
            model: pages[1],
            percentVisible: 1.0,
          ),
        ),
      ]),
    );
  }
}
