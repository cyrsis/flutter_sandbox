import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';

class FourCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/routescreen');
                },
                child: new Image.asset(AppImage.uncover_tecnique_card)),
            new Image.asset(AppImage.uncover_orgin_card),
          ],
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 10.0),
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Image.asset(AppImage.uncover_evolution_card),
              new Image.asset(AppImage.uncover_trivia_Card),
            ]),
      ],
    );
  }
}
