import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Widgets/MenuScreen.dart';
import 'package:flutter_sandbox/Widgets/OtherScreen.dart';
import 'package:flutter_sandbox/Widgets/Screen.dart';
import 'package:flutter_sandbox/Widgets/ZoomScaffold.dart';




class ZoomMenuScreen extends StatefulWidget {
  @override
  _ZoomMenuScreenState createState() => new _ZoomMenuScreenState();
}

class _ZoomMenuScreenState extends State<ZoomMenuScreen> {

  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'restaurant',
        title: 'THE PADDOCK',
      ),
      new MenuItem(
        id: 'other1',
        title: 'THE HERO',
      ),
      new MenuItem(
        id: 'other2',
        title: 'HELP US GROW',
      ),
      new MenuItem(
        id: 'other3',
        title: 'SETTINGS',
      ),
    ],
  );

  var selectedMenuItemId = 'restaurant';
  var activeScreen = restaurantScreen;

  @override
  Widget build(BuildContext context) {
    return new ZoomScaffold(
      menuScreen: new MenuScreen(
        menu: menu,
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          selectedMenuItemId = itemId;
          if (itemId == 'restaurant') {
            setState(() => activeScreen = restaurantScreen);
          } else {
            setState(() => activeScreen = otherScreen);
          }
        },
      ),
      contentScreen: activeScreen,
    );
  }
}
