import 'dart:math' as math;

final math.Random _random = new math.Random();

class Stock {
  String symbol;
  String name;
  double lastSale;
  String marketCap;
  double percentChange;

  Stock(this.symbol, this.name, this.lastSale, this.marketCap, this.percentChange);

  Stock.fromFields(List<String> fields) {
    // FIXME: This class should only have static data, not lastSale, etc.
    // "Symbol","Name","LastSale","MarketCap","IPOyear","Sector","industry","Summary Quote",
    lastSale = 0.0;
    try {
      lastSale = double.parse(fields[2]);
    } catch (_) {}
    symbol = fields[0];
    name = fields[1];
    marketCap = fields[4];
    percentChange = (_random.nextDouble() * 20) - 10;
  }
}