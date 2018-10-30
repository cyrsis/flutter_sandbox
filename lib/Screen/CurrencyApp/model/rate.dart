class ExchangeRate {
  double baseValue;
  String base;
  String date;
  Map<String, dynamic> rates;

  ExchangeRate({this.baseValue, this.base, this.date, this.rates});

  ExchangeRate.fromMap(Map<dynamic, dynamic> map)
      : baseValue = map["baseValue"],
        base = map["base"],
        date = map["date"],
        rates = map['rates'];

  Map<dynamic, dynamic> toMap() => {
        'baseValue': baseValue,
        'base': base,
        'date': date,
        'rates': rates,
      };
}
