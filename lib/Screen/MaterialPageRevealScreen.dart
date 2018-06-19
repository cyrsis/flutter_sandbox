import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/MaterialPageModel.dart';
import 'package:flutter_sandbox/Repository/pages.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/MaterialPage.dart';
import 'package:flutter_sandbox/Widgets/PageReveal.dart';
import 'package:flutter_sandbox/Widgets/Page_indicator.dart';


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
          revealpercent: 1.0,
          child: new MaterialPage(
            model: pages[1],
            percentVisible: 1.0,
          ),
        ),
        new Page_indicator(
          viewModel:
              new PageIndicatorViewModel(
                  pages,
                  0,
                  SlideDirection.none,
                  0.0),
        ),
      ]),
    );
  }
}
