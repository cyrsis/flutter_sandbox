import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sandbox/Animation/ArtistsDetailsAnimator.dart';

import 'package:flutter_sandbox/Screen/AboutScreen.dart';
import 'package:flutter_sandbox/Screen/AnimatedIndicatorScreen.dart';
import 'package:flutter_sandbox/Screen/AnimatedSizeScreen.dart';
import 'package:flutter_sandbox/Screen/AnnScreen.dart';
import 'package:flutter_sandbox/Screen/BeerHeroAnimationScreen/BeerHeroAnimationScreen.dart';
import 'package:flutter_sandbox/Screen/Calculator/CalculatorExampleScreen.dart';
import 'package:flutter_sandbox/Screen/CartBloc/CartBloCScreen.dart';
import 'package:flutter_sandbox/Screen/CustomeSliderScreen.dart';
import 'package:flutter_sandbox/Screen/DynamicThemeScreen.dart';
import 'package:flutter_sandbox/Screen/Fluttery/EggTimerScreen.dart';
import 'package:flutter_sandbox/Screen/Fluttery/FeatureDiscoveryScreen.dart';
import 'package:flutter_sandbox/Screen/Fluttery/FlipCarouselScreen.dart';
import 'package:flutter_sandbox/Screen/ImagePickerScreen.dart';
import 'package:flutter_sandbox/Screen/Fluttery/MaterialPageReveal.dart';
import 'package:flutter_sandbox/Screen/Fluttery/MusicPlayerScreen.dart';
import 'package:flutter_sandbox/Screen/Planet/ui/home/PlanetScreen.dart';
import 'package:flutter_sandbox/Screen/RadialProgressScreen.dart';
import 'package:flutter_sandbox/Screen/RouteScreen.dart';
import 'package:flutter_sandbox/Screen/RowColumnTraversal.dart';
import 'package:flutter_sandbox/Screen/ScreenExport.dart';
import 'package:flutter_sandbox/Screen/SpingAnimationScreen.dart';
import 'package:flutter_sandbox/Screen/StepperScreen.dart';
import 'package:flutter_sandbox/Screen/Stock/StockScreen.dart';
import 'package:flutter_sandbox/Screen/TabbedAppBarSample%20.dart';
import 'package:flutter_sandbox/Screen/TestScreen.dart';
import 'package:flutter_sandbox/Screen/ThemeScreen.dart';
import 'package:flutter_sandbox/Screen/Fluttery/TinderScreen.dart';
import 'package:flutter_sandbox/Screen/ThreeDAnimationScreen.dart';
import 'package:flutter_sandbox/Screen/TwoViews.dart';
import 'package:flutter_sandbox/Screen/UncoverScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sandbox/Screen/Fluttery/WeatherScreen.dart';
import 'package:flutter_sandbox/Screen/Fluttery/ZoomMenuScreen.dart';
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

const API_KEY = "AIzaSyBBEcmCP4ElyW1RR11Yy93dlJkQSC0LYRU";

void main() {
  //timeDilation = 1.0; //Slow Down the animation
  //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(new MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: "Shunga",
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? AppTheme.TinderTheme
          : AppTheme.TinderTheme,
      home: new Scaffold(
          backgroundColor: Colors.white,
          body: new PlanetScreen()),
      //body: new mainTab()),
      routes: <String, WidgetBuilder>{
        '/mainTab': (BuildContext context) => new MainTab()
      },
    ));
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
