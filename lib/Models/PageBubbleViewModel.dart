
import 'package:flutter/material.dart';

class PageBubbleViewModel {
  final String iconAsset;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(
      this.iconAsset, this.color, this.isHollow, this.activePercent);
}