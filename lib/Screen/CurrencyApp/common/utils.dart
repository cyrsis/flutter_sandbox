import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatCurrency(String country, double number) =>
    NumberFormat.simpleCurrency(name: country, decimalDigits: 2).format(number);

String formatDecimal(double number) =>
    NumberFormat('#########0.0').format(number);

String currencySymbol(String currencyCode) =>
    NumberFormat().simpleCurrencySymbol(currencyCode);

double parseTextAndReplace(String text) =>
    double.parse(text.replaceAll(",", "."));

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

/// Percentage difference is usually calculated when you want to know
/// the difference in percentage between two numbers.
double percentageDifference(double a, double b) {
  var x = a - b;
  x = x.abs();
  var y = a + b;
  y = y / 2.0;
  var z = x / y;
  return z * 100.0;
}

/// Percentage Change will quantify the change from one
/// number to another and express the change as an increase or decrease.
double percentageChange(double a, double b) => ((b - a) / a.abs()) * 100.0;

bool checkPositive(double number) => !number.isNegative;

bool dateIsBeforeToday(String date) {
  DateFormat format = new DateFormat("yyyy-MM-dd");
  var today = format.parse(format.format(DateTime.now()));
  var check = format.parse(date);
  return check.isBefore(today);
}
