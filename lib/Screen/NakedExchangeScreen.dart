import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/CircleKProductCard.dart';
import 'package:flutter_sandbox/Widgets/NotificationWidget.dart';
import 'package:country_code_picker/country_code_picker.dart';

class NakedExchangeScreen extends StatefulWidget {
  @override
  _NakedExchangeScreenState createState() => new _NakedExchangeScreenState();
}

class _NakedExchangeScreenState extends State<NakedExchangeScreen> {
  final _Inputcontroller = TextEditingController();
  bool _isFavorited = true;
  int _favoriteCount = 41;

  String _convertedValue = "";

  double _inputValue = 10.0;

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
  void dispose() {
    // TODO: implement dispose
    _Inputcontroller.dispose();
    super.dispose();
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
        elevation: 10.0,
        title: new Text(
          'Naked Exchange ',
          style: AppStyle.AppBarTextStyle,
        ),
        centerTitle: true,
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _Inputcontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Current Amount HKD",
                        hintStyle: new TextStyle(color: Colors.white),
                        icon: new Icon(
                          Icons.money_off,
                          color: Colors.white,
                        )),
                    autocorrect: true,
                    autofocus: true,
                    onChanged: _updateInputValue,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
            ),
            preferredSize: const Size.fromHeight(70.0)),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new CountryCodePicker(
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IT',
                favorite: ['+39', 'FR']),
            new ListTile(
                leading: Image(
                  width: 20.0,
                  height: 20.0,
                  image: new AssetImage(AppImage.flag_us),
                ),
                title: new Text('USD'),
                trailing: Column(
                  children: <Widget>[
                    new Text('0.127460'),
                    new Text((_inputValue * 0.127460).toString()+" USD"),
                  ],
                ),
                onTap: () {
                  /* react to the tile being tapped */
                }),
            new ListTile(
                leading: Image(
                  width: 20.0,
                  height: 20.0,
                  image: new AssetImage(AppImage.flag_cn),
                ),
                title: new Text('CNY'),
                trailing: Column(
                  children: <Widget>[
                    new Text('105.4743'),
                    new Text('7.8'),
                  ],
                ),
                onTap: () {
                  /* react to the tile being tapped */
                }),
            new ListTile(
                leading: Image(
                  width: 20.0,
                  height: 20.0,
                  image: new AssetImage(AppImage.flag_ad),
                ),
                title: new Text('AUD'),
                trailing: Column(
                  children: <Widget>[
                    new Text('528.2800'),
                    new Text('7.8'),
                  ],
                ),
                onTap: () {
                  /* react to the tile being tapped */
                }),
          ],
        ),
      ),
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
