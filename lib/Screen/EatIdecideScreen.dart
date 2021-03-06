import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Screen/PaymentScreen.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Util/Widget_Utils.dart';

class EatIdecideScreen extends StatefulWidget {
  @override
  _EatIdecideScreenState createState() => new _EatIdecideScreenState();
}

class _EatIdecideScreenState extends State<EatIdecideScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 290.0,
                  color: Color(getColorHexFromStr('006565')),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height:45.0),
                    new Text(
                      "ASAP@ HKIA - Gate 70 ",
                      style: AppStyle.Quicksand15Blod),
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.black),
                              contentPadding:
                                  EdgeInsets.only(left: 15.0, top: 15.0,bottom: 15.0),
                              hintText: 'Search for Restaurant',
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Colors.orange,
                                    style: BorderStyle.solid,
                                    width: 3.0))),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Local Food \nUnder 30 minutes',
                                    style: TextStyle(
                                      color: Colors.grey,
                                        fontSize: 20.0,
                                        fontFamily: 'Timesroman',
                                        fontWeight: FontWeight.bold)),

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.0, left: 15.0),
                      height: 125.0,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          InkWell(child: _foodCard()),
                          SizedBox(width: 10.0),
                          InkWell(child: _foodCard2()),
                          SizedBox(width: 10.0),
                          InkWell(child: _foodCard3()),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 15.0),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'November 4',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.grey,
                    fontSize: 14.0),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'TODAY',
                style: TextStyle(
                    fontFamily: 'Timesroman',
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
            ),
            SizedBox(height: 10.0),
            InkWell(
              onTap: ()=>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new PaymentScreen())),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Container(
                      height: 275.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: AssetImage(AppImage.food_duck),
                              fit: BoxFit.cover)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                        child: Container(
                          decoration:
                              BoxDecoration(color: Colors.white.withOpacity(0.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 150.0, left: 60.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'BEST OF',
                            style: AppStyle.Timesorman25BoldWhite,
                          ),
                          Text(
                            'THE DAY',
                            style: AppStyle.Timesorman25BoldWhite,
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            height: 3.0,
                            width: 50.0,
                            color: Colors.orange,
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _foodCard() {
    return Container(
      height: 125.0,
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImage.food_glutinous))),
              height: 125.0,
              width: 100.0,
            ),
          ),
          SizedBox(width: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Glutinous rice',
                style: TextStyle(fontFamily: 'Quicksand'),
              ),
              Text(
                ' dumpling',
                style: TextStyle(fontFamily: 'Quicksand'),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 2.0,
                width: 75.0,
                color: Colors.orange,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        image: DecorationImage(
                            image: AssetImage(AppImage.food_christ))),
                  ),
                  SizedBox(width: 10.0),
                  Text('Gordon \nRamsay',
                      style: TextStyle(fontFamily: 'Quicksand'))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
  Widget _foodCard2() {
    return Container(
      height: 125.0,
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImage.food_bbq))),
              height: 125.0,
              width: 100.0,
            ),
          ),
          SizedBox(width: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'BBQ',
                style: TextStyle(fontFamily: 'Quicksand'),
              ),
              Text(
                'Pork',
                style: TextStyle(fontFamily: 'Quicksand'),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 2.0,
                width: 75.0,
                color: Colors.orange,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        image: DecorationImage(
                            image: AssetImage(AppImage.food_christ))),
                  ),
                  SizedBox(width: 10.0),
                  Text('Jamie Oliver',
                      style: TextStyle(fontFamily: 'Quicksand'))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
  Widget _foodCard3() {
    return Container(
      height: 125.0,
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImage.food_sweetsourpork))),
              height: 125.0,
              width: 100.0,
            ),
          ),
          SizedBox(width: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sweet Sour',
                style: TextStyle(fontFamily: 'Quicksand'),
              ),
              Text(
                ' Pork',
                style: TextStyle(fontFamily: 'Quicksand'),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 2.0,
                width: 75.0,
                color: Colors.orange,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        image: DecorationImage(
                            image: AssetImage(AppImage.food_christ))),
                  ),
                  SizedBox(width: 10.0),
                  Text('Jamie Oliver',
                      style: TextStyle(fontFamily: 'Quicksand'))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
