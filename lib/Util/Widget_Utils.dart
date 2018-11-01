import 'package:flutter/material.dart';

void addIfNotNull(Widget child, List<Widget> children) {
  if (child != null) {
    children.add(child);
  }
}

