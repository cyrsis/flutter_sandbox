import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_currency_app/common/constants.dart';
import 'package:flutter_currency_app/common/currency_input_formatter.dart';
import 'package:flutter_currency_app/common/utils.dart';
import 'package:flutter_currency_app/model/rate.dart';
import 'package:flutter_currency_app/ui/home/home_currency_list.dart';
import 'package:flutter_currency_app/ui/home/home_page.dart';

class HomePageView extends HomePageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _exchangeRateWidget(selectedValue, selectedCurrency),
            _currencyListView(),
            _exchangeRateListWidget(selectedValue, selectedCurrency),
          ],
        ),
      ),
    );
  }

  Widget _exchangeRateWidget(double value, String base) {
    //var formatBase = formatCurrency(base, value);
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      alignment: Alignment.center,
      height: 250.0,
      width: 250.0,
      decoration: ShapeDecoration(
        color: ColorPrimary,
        shadows: [
          BoxShadow(blurRadius: 16.0, color: Colors.black.withOpacity(0.5))
        ],
        shape: CircleBorder(
          side: BorderSide(style: BorderStyle.solid, color: ColorPrimary),
        ),
      ),
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(
//                  "$formatBase",
//                  style: TextStyle(
//                      color: Colors.white.withOpacity(0.9),
//                      fontSize: 40.0,
//                      letterSpacing: 3.0,
//                      fontWeight: FontWeight.bold),
//                ),
//              ),
              _currencyTextField(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  "$base",
                  style: TextStyle(
                      color: ColorSecondary.withOpacity(0.8),
                      fontSize: 20.0,
                      letterSpacing: 3.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _exchangeRateListWidget(double value, String base) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: FutureBuilder<dynamic>(
          future: exchangeRate(base),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ExchangeRate exchange = snapshot.data;
              return HomeCurrencyList(exchange, value);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _currencyListView() {
    itemWidth = deviceWidth(context) / 2;
    if (shouldScroll) {
      Future<Null>.delayed(Duration(seconds: 5)).then((_) {
        scrollToElement(selectedCurrency);
      });
      shouldScroll = false;
    }
    return Container(
      height: 55.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: ListView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        children:
            CountryNameMap.keys.map((val) => _currencyListItem(val)).toList(),
      ),
    );
  }

  Widget _currencyListItem(String val) {
    return Container(
      height: 50.0,
      width: itemWidth,
      child: ListTile(
        contentPadding: EdgeInsets.all(0.0),
        title: Text(
          "${CountryNameMap[val]}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: (val == selectedCurrency)
                ? ColorSecondary
                : ColorSecondary.withOpacity(0.3),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          selectedCurrency = val;
          scrollToElement(val);
          saveSelectedValues();
          setState(() {});
        },
      ),
    );
  }

  Widget _currencyTextField() {
    valueController.text = "$selectedValue";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: valueController,
        inputFormatters: <TextInputFormatter>[
          CurrencyInputFormatter(
            allowSubdivisions: true,
            subdivisionMarker: ".",
          ),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
//          prefixText:
//              (baseCurrency.isEmpty) ? "" : currencySymbol(baseCurrency),
//          prefixStyle: TextStyle(
//            color: Colors.white.withOpacity(0.9),
//            fontSize: 38.0,
//            letterSpacing: 3.0,
//          ),
        ),
        autocorrect: false,
        autofocus: false,
        maxLines: 1,
        onSubmitted: (text) {
          selectedValue = parseTextAndReplace(text);
          saveSelectedValues();
        },
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 40.0,
          letterSpacing: 3.0,
          fontWeight: FontWeight.bold,
        ),
        onChanged: (text) => selectedValue = parseTextAndReplace(text),
      ),
    );
  }

//  Widget _iconButton() {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.end,
//      children: <Widget>[
//        IconButton(
//          iconSize: 32.0,
//          disabledColor: ColorSecondary.withOpacity(0.5),
//          highlightColor: ColorPrimary,
//          splashColor: ColorPrimary.withOpacity(0.7),
//          icon: Icon(
//            Icons.add,
//            color: ColorSecondary,
//          ),
//          onPressed: () => goToCurrencyPage(context),
//          padding: const EdgeInsets.only(
//              top: 24.0, bottom: 24.0, right: 24.0, left: 24.0),
//        ),
//      ],
//    );
//  }

}
