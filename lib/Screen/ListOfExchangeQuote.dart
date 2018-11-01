import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';

class ListOfExchangeQuote extends StatefulWidget {
  ListOfExchangeQuote(double inputValue, {Key key}) : super(key: key);

  double inputValue =1.0;
  @override
  _ListOfExchangeQuoteState createState() => new _ListOfExchangeQuoteState();
}

class _ListOfExchangeQuoteState extends State<ListOfExchangeQuote> {
  @override
  Widget build(BuildContext context) {
    return new Container(
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
                  new Text((widget.inputValue * 0.127460).toString() + " USD"),
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
                  new Text((widget.inputValue * 0.887129).toString() + " CNY"),
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
                  new Text((widget.inputValue * 0.179840).toString() + " AUD"),
                ],
              ),
              onTap: () {
                /* react to the tile being tapped */
              }),
        ],
      ),
    );
  }
}
