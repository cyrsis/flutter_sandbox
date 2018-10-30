import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_currency_app/common/constants.dart';
import 'package:flutter_currency_app/common/text_editing_controller.dart';
import 'package:flutter_currency_app/data/repository.dart';
import 'package:flutter_currency_app/ui/home/home_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static final String path = "/home";

  @override
  State<StatefulWidget> createState() => new HomePageView();
}

abstract class HomePageState extends State<HomePage> {
  bool shouldScroll = true;
  double selectedValue = 10.0;
  String selectedCurrency = "EUR";
  double itemWidth = ITEM_EXTENT;

  @protected
  Repository repository = new Repository();

  @protected
  exchangeRate(String base) => repository.getExchangeRate(base);

  @protected
  final TextEditingController valueController =
      new TextEditingControllerWorkaround();

  @protected
  final ScrollController scrollController = new ScrollController();

  @protected
  void scrollToElement(String val) {
    var index = CountryNameMap.keys.toList().indexOf(val);
    scrollController.animateTo(((index * itemWidth) - (itemWidth / 2)),
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  @protected
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  @protected
  void saveSelectedValues() {
    sharedPreferences.then((pref) {
      pref.setDouble(SAVED_VALUE, selectedValue);
      pref.setString(SAVED_CURRENCY, selectedCurrency);
    });
  }

  @protected
  void getSelectedValues() {
    sharedPreferences.then((pref) {
      selectedValue = pref.getDouble(SAVED_VALUE) ?? 10.0;
      selectedCurrency = pref.getString(SAVED_CURRENCY) ?? "EUR";
      setState(() {});
    });
  }

  @override
  void initState() {
    getSelectedValues();
    super.initState();
  }
}
