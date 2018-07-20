

import 'dart:async';

import 'package:flutter_sandbox/i18n/stock_messages_all.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';



class StockStrings {
  StockStrings(Locale locale) : _localeName = locale.toString();

  final String _localeName;

  static Future<StockStrings> load(Locale locale) {
    return initializeMessages(locale.toString())
        .then((Object _) {
      return new StockStrings(locale);
    });
  }

  static StockStrings of(BuildContext context) {
    return Localizations.of<StockStrings>(context, StockStrings);
  }

  String title() {
    return Intl.message(
      '<Stocks>',
      name: 'title',
      desc: 'Title for the Stocks application',
      locale: _localeName,
    );
  }

  String market() => Intl.message(
    'MARKET',
    name: 'market',
    desc: 'Label for the Market tab',
    locale: _localeName,
  );

  String portfolio() => Intl.message(
    'PORTFOLIO',
    name: 'portfolio',
    desc: 'Label for the Portfolio tab',
    locale: _localeName,
  );
}
