import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/MaterialPageModel.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class MaterialPage extends StatelessWidget {
  final MaterialPageModel model;
  final double percentVisible;

  const MaterialPage({Key key, this.model, this.percentVisible = 1.0}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      color: model.color,
      child: new Opacity(
        opacity: percentVisible,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //image
            new Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: new Image.asset(model.heroAssetPath,
                  width: 200.0, height: 200.0),
            ),

            //Title
            new Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: new Text(model.title, style: AppStyle.MaterialPageTitleText),
            ),

            //Body
            new Padding(
              padding: const EdgeInsets.only(bottom: 75.0),
              child: new Text(
                model.body,
                style: AppStyle.BodyStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
