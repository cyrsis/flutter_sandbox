import 'dart:async';
import 'dart:convert';

import 'package:flutter_currency_app/common/constants.dart';
import 'package:flutter_currency_app/common/utils.dart';
import 'package:flutter_currency_app/data/remote.dart';
import 'package:flutter_currency_app/model/rate.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  ExchangeRate _exchangeRate;

  var _encoder = JsonEncoder();
  var _decoder = JsonDecoder();

  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  _saveLocalExchangeRates(ExchangeRate rates) async {
    final SharedPreferences pref = await sharedPreferences;
    var json = _encoder.convert(rates.toMap());
    pref.setString(EXCHANGE_RATES + rates.base, json);
  }

  _getLocalExchangeRates(String base) async {
    final SharedPreferences pref = await sharedPreferences;
    var shared = pref.getString(EXCHANGE_RATES + base);
    if (shared == null) return null;
    var map = _decoder.convert(shared);
    return ExchangeRate.fromMap(map);
  }

  _getRemoteExchangeRates(String base) async {
    Completer<Null> completer = new Completer<Null>();
    fetchLatestRates(Client(), base).then((obj) {
      if (obj != null) {
        _saveLocalExchangeRates(obj);
        _exchangeRate = obj;
      }
      completer.complete();
    });

    return completer.future;
  }

  getExchangeRate(String base) async {
    _exchangeRate = await _getLocalExchangeRates(base);
    if (_exchangeRate == null ||
        (_exchangeRate != null && dateIsBeforeToday(_exchangeRate.date))) {
      await _getRemoteExchangeRates(base);
    }
    return _exchangeRate;
  }
}
