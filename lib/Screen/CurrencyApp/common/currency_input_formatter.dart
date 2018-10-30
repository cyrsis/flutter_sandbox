import 'package:flutter/services.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter(
      {this.allowSubdivisions = true, this.subdivisionMarker = "."});

  final bool allowSubdivisions;
  final String subdivisionMarker;

  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Refuse to let the new value in, if one of these is true:
    // a) subdivisions are not allowed and the user is attempting to create one,
    if (!allowSubdivisions && newValue.text.contains(subdivisionMarker)) {
      return oldValue;
    }
    // b) not all of the characters are digits or the subdivision marker,
    if (new RegExp("[0-9]|\\$subdivisionMarker")
            .allMatches(newValue.text)
            .length !=
        newValue.text.length) {
      return oldValue;
    }
    // or, c) the user is trying to create more subdivisions than are allowed in a currency value
    if (new RegExp("\\$subdivisionMarker").allMatches(newValue.text).length >
        1) {
      return oldValue;
    }
    return newValue;
  }
}
