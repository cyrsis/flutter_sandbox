import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/CircleKProductCard.dart';
import 'package:flutter_sandbox/Widgets/NotificationWidget.dart';

class CircleKScreen extends StatefulWidget {
  @override
  _CircleKScreenState createState() => new _CircleKScreenState();
}

class _CircleKScreenState extends State<CircleKScreen> {
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

  Widget _buildUmbella(){
    if (_isFavorited) {
      return new CircleKProductCard(assetpath: "assets/circlek/numbella.jpg",
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
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: _toggleFavorite,
        ),
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: new Text(
          'CircleK ',
          style: AppStyle.AppBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            _buildNotification(),
            _buildUmbella(),
            new CircleKProductCard(
              assetpath: "assets/circlek/fastfood.jpeg",
              icon: Icons.fastfood,
              iconbackgrouncolor: Colors.redAccent,
              title: "Fast Food",
              subtitle: "It is a fish ball",
              heartcount: 99,
            ),
            new CircleKProductCard(
              assetpath: "assets/circlek/icecream.jpg",
              icon: Icons.favorite,
              iconbackgrouncolor: Colors.deepOrangeAccent,
              title: "Beakfast Go",
              subtitle: "Veggie only",
              heartcount: 45,
            ),
            new CircleKProductCard(
              assetpath: "assets/circlek/noodles.jpeg",
              icon: Icons.event,
              iconbackgrouncolor: Colors.greenAccent,
              title: "Noddles Refresh",
              subtitle: "Bring a smile",
              heartcount: 62,
            ),
          ],
        ),
      ),
    );
  }
}
