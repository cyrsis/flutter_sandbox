import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/PageBubbleViewModel.dart';

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel viewmodel;

  const PageBubble({Key key, this.viewmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 55.0,
      height: 65.0,
      child: new Center(
        child: new Container(
          width: ui.lerpDouble(20, 45, viewmodel.activePercent),
          height: ui.lerpDouble(20, 45, viewmodel.activePercent),
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              color: viewmodel.isHollow
                  ? const Color(0x88FFFFFF)
                  .withAlpha((0x88 * viewmodel.activePercent).round())
                  : const Color(0x88FFFFFF),
              border: new Border.all(
                  color: viewmodel.isHollow
                      ? const Color(0x88FFFFFF).withAlpha(
                      (0x88 * (1 - viewmodel.activePercent)).round())
                      : Colors.transparent,
                  width: 3.0)),
          child: new Opacity(
            opacity: viewmodel.activePercent,
            child: new Image.asset(
              viewmodel.iconAsset,
              color: viewmodel.color,
            ),
          ),
        ),
      ),
    );
  }
}
