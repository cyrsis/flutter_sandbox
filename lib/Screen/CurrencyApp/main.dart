//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:flutter_currency_app/common/constants.dart';
//import 'package:flutter_currency_app/common/routes.dart';
//import 'package:flutter_currency_app/ui/home/home_page.dart';
//import 'package:flutter_currency_app/ui/intro/intro_page.dart';
//import 'package:flutter_sandbox/Screen/CurrencyApp/common/constants.dart';
//import 'package:flutter_sandbox/Screen/CurrencyApp/common/routes.dart';
//import 'package:flutter_sandbox/Screen/CurrencyApp/ui/home/home_page.dart';
//import 'package:flutter_sandbox/Screen/CurrencyApp/ui/intro/intro_page.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//Future main() async {
//  Widget _defaultHome = IntroPage();
//
//  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
//  final SharedPreferences pref = await sharedPreferences;
//  bool showIntro = pref.getBool(SKIP_INTRO);
//  if (showIntro != null && showIntro) {
//    _defaultHome = HomePage();
//  }
//
//  runApp(App(_defaultHome));
//}
//
//class App extends StatelessWidget {
//  final Widget defaultHome;
//  App(this.defaultHome);
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "Currency Converter",
//      theme: ThemeData(
//        accentColor: ColorSecondary.withOpacity(0.7),
//        primaryColor: ColorPrimary,
//      ),
//      home: defaultHome,
//      routes: routes,
//      debugShowCheckedModeBanner: false,
//    );
//  }
//}
