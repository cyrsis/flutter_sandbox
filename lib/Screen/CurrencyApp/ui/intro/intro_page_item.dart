import 'package:flutter/material.dart';
import 'package:flutter_currency_app/model/intro.dart';

class IntroPageItem extends StatelessWidget {
  IntroPageItem({this.item});

  final IntroItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: item.color,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            item.icon,
            fit: BoxFit.fill,
            color: Colors.white.withOpacity(0.6),
            width: 100.0,
            height: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 48.0, left: 48.0),
            child: Text(
              item.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
