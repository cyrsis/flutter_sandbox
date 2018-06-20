import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sandbox/Animation/ArtistsDetailsAnimator.dart';
import 'package:flutter_sandbox/Screen/APIScreen.dart';

import 'package:flutter_sandbox/Screen/AboutScreen.dart';
import 'package:flutter_sandbox/Screen/AnimatedIndicatorScreen.dart';
import 'package:flutter_sandbox/Screen/AnimatedSizeScreen.dart';
import 'package:flutter_sandbox/Screen/AnimationBasicScreen.dart';
import 'package:flutter_sandbox/Screen/AnimationControllerOutputScreen.dart';
import 'package:flutter_sandbox/Screen/AnimationPlayerExampleScreen.dart';
import 'package:flutter_sandbox/Screen/BatteryScreen.dart';
import 'package:flutter_sandbox/Screen/ButtonRowScreen.dart';
import 'package:flutter_sandbox/Screen/ChatScreenSample.dart';
import 'package:flutter_sandbox/Screen/ClockScreen.dart';
import 'package:flutter_sandbox/Screen/ContactsDemo.dart';
import 'package:flutter_sandbox/Screen/DeviceInfoScreen.dart';
import 'package:flutter_sandbox/Screen/DirectoryScreen.dart';
import 'package:flutter_sandbox/Screen/EpsonPosScreen.dart';
import 'package:flutter_sandbox/Screen/FriendsScreen.dart';
import 'package:flutter_sandbox/Screen/GalleryScreen.dart';
import 'package:flutter_sandbox/Screen/InternetConnectionScreen.dart';
import 'package:flutter_sandbox/Screen/LayOutScreen.dart';
import 'package:flutter_sandbox/Screen/LifeCycleScreen.dart';
import 'package:flutter_sandbox/Screen/LoginScreen.dart';
import 'package:flutter_sandbox/Screen/MaterialPageRevealScreen.dart';
import 'package:flutter_sandbox/Screen/RestaruarntAnimationScreen.dart';
import 'package:flutter_sandbox/Screen/RowColScreen.dart';
import 'package:flutter_sandbox/Screen/SilverAppBarScreen.dart';
import 'package:flutter_sandbox/Screen/SplashScreen.dart';
import 'package:flutter_sandbox/Screen/StackScreen.dart';
import 'package:flutter_sandbox/Screen/StreamScreens.dart';
import 'package:flutter_sandbox/Screen/SwipScreenTest.dart';
import 'package:flutter_sandbox/Screen/SwipeScreen.dart';
import 'package:flutter_sandbox/Screen/TabTopScreen.dart';
import 'package:flutter_sandbox/Screen/BasicAppBarSample.dart';
import 'package:flutter_sandbox/Screen/ChartScreen.dart';
import 'package:flutter_sandbox/Screen/ExpansionTileSample.dart';
import 'package:flutter_sandbox/Screen/ExploreScreen.dart';
import 'package:flutter_sandbox/Screen/GetJsonScreen.dart';
import 'package:flutter_sandbox/Screen/HomeScreen.dart';
import 'package:flutter_sandbox/Screen/ProfileScreen.dart';
import 'package:flutter_sandbox/Screen/QRScreen.dart';
import 'package:flutter_sandbox/Screen/RouteScreen.dart';
import 'package:flutter_sandbox/Screen/RowColumnTraversal.dart';
import 'package:flutter_sandbox/Screen/StepperScreen.dart';
import 'package:flutter_sandbox/Screen/TabbedAppBarSample%20.dart';
import 'package:flutter_sandbox/Screen/TestScreen.dart';
import 'package:flutter_sandbox/Screen/ThemeScreen.dart';
import 'package:flutter_sandbox/Screen/TwoViews.dart';
import 'package:flutter_sandbox/Screen/UncoverScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sandbox/Screen/AnimatedListSample.dart';
import 'package:flutter_sandbox/Styles/AppIcons.dart';
import 'package:flutter_sandbox/Styles/AppTheme.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_sandbox/Widgets/LoginForm.dart';
import 'package:flutter_sandbox/Widgets/custom_render_box.dart';
import 'package:redux/redux.dart';
import 'package:flutter_sandbox/Redux/AppStateReducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(new MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: "Shunga",
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? AppTheme.Apptheme
          : AppTheme.androidTheme,
      home: new Scaffold(
          backgroundColor: Colors.white,
          body: new mainTab()),
      //body: new mainTab()),
      routes: <String, WidgetBuilder>{
        '/mainTab': (BuildContext context) => new mainTab()
      },
    ));

class mainTab extends StatefulWidget {
  @override
  _mainTabState createState() => new _mainTabState();
}

class _mainTabState extends State<mainTab> with SingleTickerProviderStateMixin {
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
