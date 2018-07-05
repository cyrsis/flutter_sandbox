import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/Stock.dart';

import 'package:http/http.dart' as http;

class StockData extends ChangeNotifier {
  StockData() {
    if (actuallyFetchData) {
      _httpClient = new http.Client();
      _fetchNextChunk();
    }
  }

  final List<String> _symbols = <String>[];
  final Map<String, Stock> _stocks = <String, Stock>{};

  Iterable<String> get allSymbols => _symbols;

  Stock operator [](String symbol) => _stocks[symbol];

  bool get loading => _httpClient != null;

  void add(List<dynamic> data) {
    for (List<dynamic> fields in data) {
      final Stock stock = new Stock.fromFields(fields.cast<String>());
      _symbols.add(stock.symbol);
      _stocks[stock.symbol] = stock;
    }
    _symbols.sort();
    notifyListeners();
  }

  static const int _chunkCount = 30;
  int _nextChunk = 0;

  String _urlToFetch(int chunk) {
    return 'https://domokit.github.io/examples/stocks/data/stock_data_$chunk.json';
  }

  http.Client _httpClient;

  static bool actuallyFetchData = true;

  void _fetchNextChunk() {
    _httpClient
        .get(_urlToFetch(_nextChunk++))
        .then<Null>((http.Response response) {
      final String json = response.body;
      if (json == null) {
        debugPrint('Failed to load stock data chunk ${_nextChunk - 1}');
        _end();
        return;
      }
      const JsonDecoder decoder = const JsonDecoder();
      add(decoder.convert(json));
      if (_nextChunk < _chunkCount) {
        _fetchNextChunk();
      } else {
        _end();
      }
    });
  }

  void _end() {
    _httpClient?.close();
    _httpClient = null;
  }
}
