//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:flutter_currency_app/common/constants.dart';
//import 'package:flutter_currency_app/ui/home/home_page.dart';
//import 'package:flutter_currency_app/ui/intro/intro_page_view.dart';
//import 'package:flutter_sandbox/Screen/CurrencyApp/common/constants.dart';
//import 'package:flutter_sandbox/Screen/CurrencyApp/ui/home/home_page.dart';
//import 'package:flutter_sandbox/Screen/CurrencyApp/ui/intro/intro_page_view.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//class IntroPage extends StatefulWidget {
//  static final String path = "/intro";
//
//  @override
//  State<StatefulWidget> createState() => new IntroPageView();
//}
//
//abstract class IntroPageState extends State<IntroPage> {
//  @protected
//  final Future<SharedPreferences> sharedPreferences =
//      SharedPreferences.getInstance();
//
//  @protected
//  final pageIndexNotifier = ValueNotifier<int>(0);
//
//  @protected
//  final PageController controller = new PageController();
//
//  @protected
//  void goHome(BuildContext context) async {
//    final SharedPreferences pref = await sharedPreferences;
//    pref.setBool(SKIP_INTRO, true);
//    Navigator.of(context).pushReplacementNamed(HomePage.path);
//  }
//}
