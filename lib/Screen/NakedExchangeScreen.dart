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
  bool _isFavorited = true;
  int _favoriteCount = 41;

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
  Widget build(BuildContext context) {
    final _controller = TextEditingController();

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
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Current Amount HKD",
                      hintStyle: new TextStyle(color: Colors.white),
                      icon: new Icon(Icons.people, color: Colors.white,)),
                  autocorrect: false,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                ),

                IconButton(
                    icon: Icon(Icons.crop_rotate),
                    onPressed: null
                ),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Amount JPY",
                      hintStyle: new TextStyle(color: Colors.white),
                      icon: new Icon(Icons.people, color: Colors.white,)),
                  autocorrect: false,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                ),

              ],
            ),
            preferredSize: const Size.fromHeight(120.0)),
      ),
      body: new Container(
        child: new ListView(
            children: <Widget>[

        new CountryCodePicker(
        onChanged: print,
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: 'IT',
            favorite: ['+39', 'FR'])
      ,

      new ListTile(
        leading: Image(
          width: 20.0,
          height: 20.0,
          image: new AssetImage(
              "flags/us.png"),
        ),
        title: new Text('USD'),
        trailing: new Text('2000'),
      ),
      new ListTile(
          leading: new Icon(Icons.photo),
          title: new Text('JPY'),
          trailing: new Text('2000')),
      new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('HKD'),
          trailing: new Text('2000')),
      new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('HKD'),
          trailing: new Text('2000')),
      new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('HKD'),
          trailing: new Text('2000')),
      new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('HKD'),
          trailing: new Text('2000')),
      new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('HKD'),
          trailing: new Text('2000')),
      new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('HKD'),
          trailing: new Text('2000')),
      new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('HKD'),
          trailing: new Text('2000')),
      new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text('HKD'),
          trailing: new Text('2000')),
      ],
    ),)
    ,
    );
  }
}
