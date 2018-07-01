import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Animation/AnimatedPageDragger.dart';
import 'package:flutter_sandbox/Models/MaterialPageModel.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class MaterialPage extends StatelessWidget {
  final MaterialPageModel model;
  final double percentVisible;

  const MaterialPage({Key key, this.model, this.percentVisible = 1.0})
      : super(key: key);

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
            new Transform(
              child: new Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: new Image.asset(model.heroAssetPath,
                    width: 200.0, height: 200.0),
              ),
              transform: new Matrix4.translationValues(
                  0.0, 50.0 * (1 - percentVisible), 0.0),
            ),

            //Title
            new Transform(
              child: new Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: new Text(model.title,
                    style: AppStyle.MaterialPageTitleText),
              ),
              transform: new Matrix4.translationValues(
                  0.0, 30.0 * (1 - percentVisible), 0.0),
            ),

            //Body
            new Transform(
              child: new Padding(
                padding: const EdgeInsets.only(bottom: 75.0),
                child: new Text(
                  model.body,
                  style: AppStyle.BodyStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1 - percentVisible), 0.0),
            ),
          ],
        ),
      ),
    );
  }
}
