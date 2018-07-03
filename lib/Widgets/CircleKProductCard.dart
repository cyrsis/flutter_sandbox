import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class CircleKProductCard extends StatelessWidget {
  final String assetpath;
  final IconData icon;
  final Color iconbackgrouncolor;
  final String title;
  final String subtitle;
  final int heartcount;

  const CircleKProductCard(
      {Key key,
      this.assetpath,
      this.icon,
      this.iconbackgrouncolor,
      this.title,
      this.subtitle,
      this.heartcount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Card(
            elevation: 10.0,
            child: new Column(
              children: <Widget>[
                new Image.asset(
                  assetpath,
                  width: double.infinity,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                            borderRadius:
                            new BorderRadius.all(Radius.circular(15.0)),
                            color: iconbackgrouncolor),
                        child: new Icon(
                          icon,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    new Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(title,
                              style: AppStyle.RestaruantCardTitle),
                          new Text(subtitle,
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
                          new Text(heartcount.toString(), style: AppStyle.RestaruantCardNumOfHeart),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
        ),

        new Padding(
          padding: const EdgeInsets.all(12.0),
          child: new Image.asset(
              'assets/circlek/circlelogo.png', width: 20.0,
              height: 20.0),
        )
      ],
    );
  }
}
