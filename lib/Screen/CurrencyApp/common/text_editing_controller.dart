import 'package:flutter/material.dart';

/// Keyboard cursor should go to end of line when TextField is set via TextEditController
/// TextEditingControllerWorkaround
/// https://github.com/flutter/flutter/issues/11416
class TextEditingControllerWorkaround extends TextEditingController {
  TextEditingControllerWorkaround({String text}) : super(text: text);

  void setTextAndPosition(String newText, {int caretPosition}) {
    int offset = caretPosition != null ? caretPosition : newText.length;
    value = value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: offset),
        composing: TextRange.empty);
  }

  set text(String newText) {
    setTextAndPosition(newText);
  }
}
