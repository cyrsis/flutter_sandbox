import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/AuthFirebae/LoginMainScreen.dart';
import 'package:flutter_sandbox/AuthFirebae/TestFirebaseSignInScreen.dart';
import 'package:flutter_sandbox/JobsApp/JobMainScreen.dart';
import 'package:flutter_sandbox/NewsApp/widgets/NewsAppMainScreen.dart';
import 'package:flutter_sandbox/ReduxAppActions.dart';
import 'package:flutter_sandbox/ReduxAppExample.dart';
import 'package:flutter_sandbox/Screen/AboutScreen.dart';
import 'package:flutter_sandbox/Screen/AddRemoveListWidgetScreen.dart';
import 'package:flutter_sandbox/Screen/ArrowScreen.dart';
import 'package:flutter_sandbox/Screen/BurgerTruckScreen.dart';
import 'package:flutter_sandbox/Screen/CalculatorScreen.dart';
import 'package:flutter_sandbox/Screen/ColorFilterScreen.dart';
import 'package:flutter_sandbox/Screen/EatIdecideScreen.dart';
import 'package:flutter_sandbox/Screen/FireStoreCRUD/FireStoreScreen.dart';
import 'package:flutter_sandbox/Screen/FoodReceiptScreen.dart';
import 'package:flutter_sandbox/Screen/HireTalent/HireTalentScreen.dart';
import 'package:flutter_sandbox/Screen/ImageCarouselScreen.dart';
import 'package:flutter_sandbox/Screen/Login/SignUpMinMainScreen.dart';
import 'package:flutter_sandbox/Screen/NakedExchangeScreen.dart';
import 'package:flutter_sandbox/Screen/AnimatedSizeScreen.dart';
import 'package:flutter_sandbox/Screen/Coffee.dart';
import 'package:flutter_sandbox/Screen/FlutterMapScreen.dart';
import 'package:flutter_sandbox/Screen/ListCardsScreen.dart';
import 'package:flutter_sandbox/Screen/PaymentScreen.dart';
import 'package:flutter_sandbox/Screen/PopUpMenuScreen.dart';
import 'package:flutter_sandbox/Screen/ScanQrScreen.dart';
import 'package:flutter_sandbox/Screen/SetStateScreen.dart';
import 'package:flutter_sandbox/Screen/SliderAnimationScreen.dart';
import 'package:flutter_sandbox/Screen/TimeOutScreen.dart';
import 'package:flutter_sandbox/Screen/TravelScreen.dart';
import 'package:flutter_sandbox/Screen/RouteScreen.dart';
import 'package:flutter_sandbox/Screen/ScreenExport.dart';
import 'package:flutter_sandbox/Screen/TestScreen.dart';
import 'package:flutter_sandbox/Screen/UncoverScreen.dart';
import 'package:flutter_sandbox/Styles/AppIcons.dart';
import 'package:flutter_sandbox/Styles/AppTheme.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//Redux
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

const API_KEY = "AIzaSyBBEcmCP4ElyW1RR11Yy93dlJkQSC0LYRU";
//enum Actions { Increment, Decrement }
//
enum Actions { Increment, Decrement }

int reducer(int state, dynamic action) {
  if (action == Actions.Increment) state++;
  if (action == Actions.Decrement) state--;

  return state;
}

void main() {
  //timeDilation = 1.0; //Slow Down the animation
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
//Using Redux
//  final store = new Store<int>(reducer, initialState: 0);
//  runApp(ReduxAppExample(store: store));
  runApp(new MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: "Block Manic Inc",
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? AppTheme.TinderTheme
          : AppTheme.TinderTheme,
      home: new NewsAppMainScreen(),
      //body: new mainTab()),
      routes: <String, WidgetBuilder>{
        '/mainTab': (BuildContext context) => new MainTab()
      },
    )
  );
}

class MainTab extends StatefulWidget {
  @override
  _MainTabState createState() => new _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  static const String routeName = "/mainTab";

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        // Prevent swipe popping of this page. Use explicit exit buttons on
        // ly.
        onWillPop: () => new Future<bool>.value(true),
        child: new CupertinoTabScaffold(
          tabBar: new CupertinoTabBar(
            backgroundColor: Colors.transparent,
            activeColor: const Color(0xFF615147),
            inactiveColor: const Color(0xFF918984),
            items: const <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: const Icon(AppIcons.TabBarHome),
                title: const Text('Layout'),
              ),
              const BottomNavigationBarItem(
                icon: const Icon(AppIcons.TabBarExplore),
                title: const Text('Explore'),
              ),
              const BottomNavigationBarItem(
                icon: const Icon(AppIcons.TabBarUncover),
                title: const Text('Uncover'),
              ),
              const BottomNavigationBarItem(
                icon: const Icon(AppIcons.TabBarAbout),
                title: const Text('About'),
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return new DefaultTextStyle(
              style: const TextStyle(
                fontFamily: '.SF UI Text',
                fontSize: 17.0,
                color: CupertinoColors.black,
              ),
              child: new CupertinoTabView(
                routes: <String, WidgetBuilder>{
                  // Set named routes
                  RouteScreen.routeName: (BuildContext context) =>
                      new RouteScreen(),
                  "/webview": (_) => new WebviewScaffold(
                        url: "https://www.google.com",
                        appBar: new AppBar(
                          title: new Text("WebView"),
                        ),
                        withJavascript: true,
                        withLocalStorage: true,
                        withZoom: true,
                      )
                },
                builder: (BuildContext context) {
                  switch (index) {
                    case 0:
                      return new AnimatedSizeScreen(); //Home
                      break;
                    case 1:
                      return new SwipeScreenTest();
                      break;
                    case 2:
                      return new UncoverScreen();
                      break;
                    case 3:
                      return new AboutScreen();
                      break;
                    default:
                  }
                },
              ), //End of Child
            );
          },
        )); //End of IOSTab
  }
}
