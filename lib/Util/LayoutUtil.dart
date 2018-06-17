import 'package:flutter/foundation.dart';

enum LayoutGorup { nonScrollable, scrollable }

abstract class HasLayoutGroup{
   LayoutGorup get layoutgroup ;
   VoidCallback get onLayoutToggle;

}

enum LayoutType {
  rowColum,
  baseline,
  stack,
  expanded,
  padding,
  pageView,
  list,
  silver,
  hero,
  nested,
}