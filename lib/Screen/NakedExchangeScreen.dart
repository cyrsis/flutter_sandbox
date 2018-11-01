import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Screen/AboutScreen.dart';
import 'package:flutter_sandbox/Screen/HomeScreen.dart';
import 'package:flutter_sandbox/Screen/ListOfExchangeOffer.dart';
import 'package:flutter_sandbox/Screen/ListOfExchangeQuote.dart';
import 'package:flutter_sandbox/Screen/ProfilePage.dart';
import 'package:flutter_sandbox/Screen/ProfileScreen.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/CircleKProductCard.dart';
import 'package:flutter_sandbox/Widgets/NotificationWidget.dart';
import 'package:country_code_picker/country_code_picker.dart';

class NakedExchangeScreen extends StatefulWidget {
  @override
  _NakedExchangeScreenState createState() => new _NakedExchangeScreenState();
}

class _NakedExchangeScreenState extends State<NakedExchangeScreen>
    with SingleTickerProviderStateMixin {
  final _Inputcontroller = TextEditingController();
  bool _isFavorited = true;
  int _favoriteCount = 41;
  String _convertedValue = "";
  double _inputValue = 10.0;

  TabController tabController;

  void _toggleFavorite() {
    setState(() {
      print("Toogle agin");
      // If the lake is currently favorited, unfavorite it.
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  Widget _buildNotification() {
    if (_isFavorited) {
      return new NotificationWidget();
    }

    return new Container();
  }

  Widget _buildUmbella() {
    if (_isFavorited) {
      return new CircleKProductCard(
        assetpath: "assets/circlek/numbella.jpg",
        icon: Icons.add_alert,
        iconbackgrouncolor: Colors.black,
        title: "Umberlla On Demand",
        subtitle: "The best you money can buy",
        heartcount: 99,
      );
    }

    return new Container();
  }

  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _Inputcontroller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return new TabBar(
      indicatorColor: Colors.white,
      labelColor: Colors.white,
      tabs: <Tab>[
        new Tab(
          text: "Buyer",
        ),
        new Tab(
          text: "Seller",
        ),
      ],
      // setup the controller
      controller: tabController,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: _toggleFavorite,
        ),
        backgroundColor: Colors.redAccent,
        title: new Text(
          'Naked Exchange ',
          style: AppStyle.AppBarTextStyle,
        ),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            child: Hero(
              tag: AppImage.travelscreen_chris,
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                        image: AssetImage(AppImage.travelscreen_chris))),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new ProfilePage()));
            },
          )
        ],
        bottom: PreferredSize(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 10.0),
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          contentPadding:
                          EdgeInsets.only(left: 15.0, top: 15.0,bottom: 10.0),
                          hintText: 'Exchange HKD Amount ',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
//                Material(
//                  borderRadius: BorderRadius.circular(25.0),
//                  elevation: 10.0,
//                  child: Padding(
//                    padding: const EdgeInsets.only(left: 100.0, right: 50.0),
//                    child: TextField(
//                      controller: _Inputcontroller,
//                      decoration: InputDecoration(
//                          border: InputBorder.none,
//                          fillColor: Colors.white,
//                          hintText: "Amount HKD",
//                          hintStyle: new TextStyle(color: Colors.white),
//                          icon: new Icon(
//                            Icons.nature_people,
//                            color: Colors.white,
//                            size: 35.0 ,
//                          )),
//                      autocorrect: true,
//                      autofocus: true,
//                      onChanged: _updateInputValue,
//                      keyboardType:
//                          TextInputType.numberWithOptions(decimal: true),
//                    ),
//                  ),
//                ),
                getTabBar()
              ],
            ),
            preferredSize: const Size.fromHeight(90.0)),
      ),
      body: getTabBarView(
          <Widget>[ListOfExchangeQuote(_inputValue), ListOfExchangeOffer()]),
    );
  }

  void _updateInputValue(String input) {
    setState(() {
      try {
        final inputDouble = double.parse(input);
        _inputValue = inputDouble;
      } on Exception catch (e) {
        print('Error: $e');
      }
    });
  }
}
