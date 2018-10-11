import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/CircleKProductCard.dart';
import 'package:flutter_sandbox/Widgets/NotificationWidget.dart';

class AirExchangeScreen extends StatefulWidget {
  @override
  _AirExchangeScreenState createState() => new _AirExchangeScreenState();
}

class _AirExchangeScreenState extends State<AirExchangeScreen> {
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
        elevation: 0.0,
        title: new Text(
          'AirExchange ',
          style: AppStyle.AppBarTextStyle,
        ),
        centerTitle: true,
        bottom: PreferredSize(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: "Amount",

                        hintStyle: new TextStyle(color: Colors.white),
                        icon: new Icon(Icons.people,color: Colors.white,)),
                    autocorrect: false,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                  ),
                )
              ],
            ),
            preferredSize: const Size.fromHeight(70.0)),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.map),
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
        ),
      ),
    );
  }
}
