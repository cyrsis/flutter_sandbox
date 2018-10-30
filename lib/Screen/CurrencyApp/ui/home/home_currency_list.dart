import 'package:flutter/material.dart';
import 'package:flutter_currency_app/common/constants.dart';
import 'package:flutter_currency_app/common/utils.dart';
import 'package:flutter_currency_app/model/rate.dart';

class HomeCurrencyList extends StatelessWidget {
  final ExchangeRate _exchangeRate;
  final double _baseValue;

  HomeCurrencyList(this._exchangeRate, this._baseValue);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: _buildArticleList(context),
    );
  }

  List<Widget> _buildArticleList(BuildContext context) {
    var _rates = _exchangeRate.rates;
    var sortedKeys = _rates.keys.toList()..sort();
    return sortedKeys
        .map((currency) =>
            _listItem(context, currency, _rates[currency], _baseValue))
        .toList();
  }

  Widget _listItem(
      BuildContext context, String currency, double rate, double baseValue) {
    var exRate = baseValue * rate;
    var ex = formatCurrency(currency, exRate);
    var percent = percentageChange(baseValue, baseValue * rate);
    var formatted = formatDecimal(percent);

    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: ColorSecondary.withOpacity(0.5)))),
      child: ListTile(
        title:
            Text("$ex", style: TextStyle(color: ColorPrimary, fontSize: 18.0)),
        trailing: Text("$formatted %",
            style: TextStyle(
                color: (checkPositive(percent))
                    ? Colors.green.withOpacity(0.8)
                    : Colors.red.withOpacity(0.8),
                fontSize: 14.0)),
        subtitle: Row(
          children: <Widget>[
            Text("$currency",
                style: TextStyle(color: ColorSecondary.withOpacity(0.5))),
            Text(" | ${CountryNameMap[currency]}",
                style: TextStyle(color: Colors.black45, fontSize: 14.0)),
          ],
        ),
      ),
    );
  }
}
