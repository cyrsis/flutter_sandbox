import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class RestaurantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 10.0,
        child: new Column(
          children: <Widget>[
            new Image.asset(
              AppImage.egggs_in_skillet,
              width: double.infinity,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            new Row(
              children: <Widget>[
                //Todo Icon Wiget
                new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(Radius.circular(15.0)),
                        color: Colors.red),
                    child: new Icon(
                      Icons.fastfood,
                      color: Colors.white,
                    ),
                  ),
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text('il domace',
                          style: AppStyle.RestaruantCardTitle),
                      new Text('78  5TH AVENUE, NET YORK',
                          style: AppStyle.RestaruantCardSubTitle),
                    ],
                  ),
                ),
                new Container(
                  width: 2.0,
                  height: 70.0,
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white,
                      Colors.black12,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                ),

                new Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      new Text('55', style: AppStyle.RestaruantCardNumOfHeart),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
