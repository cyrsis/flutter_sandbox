import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/MaterialPageModel.dart';

enum SlideDirection {
  lefToRight,
  RightToLeft,
  none,
}

class PageIndicatorViewModel {
  final List<MaterialPageModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidepercent;

  PageIndicatorViewModel(
      this.pages, this.activeIndex, this.slideDirection, this.slidepercent);
}

class PageBubbleViewModel {
  final String iconAsset;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(
      this.iconAsset, this.color, this.isHollow, this.activePercent);
}

class Page_indicator extends StatelessWidget {
  final PageIndicatorViewModel viewModel;

  Page_indicator({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PageBubble> bubbles = [];

    for (var i = 0; i < viewModel.pages.length; i++) {
      var percentActive;
      if (i == viewModel.activeIndex) {
        percentActive = 1.0 - viewModel.slidepercent;
      } else if (i == viewModel.activeIndex - 1 &&
          viewModel.slideDirection == SlideDirection.lefToRight) {
        percentActive = viewModel.slidepercent;
      } else if (i == viewModel.activeIndex + 1 &&
          viewModel.slideDirection == SlideDirection.RightToLeft) {
        percentActive = viewModel.slidepercent;
      } else {
        percentActive = 0.0;
      }

      final pages = viewModel.pages[i];
      bubbles.add(new PageBubble(
        viewmodel: new PageBubbleViewModel(pages.iconAssetPath, pages.color,
            i > viewModel.activeIndex, percentActive),
      ));
    }

    return new Column(
      children: <Widget>[
        new Expanded(child: new Container()),
        new Row(mainAxisAlignment: MainAxisAlignment.center, children: bubbles)
      ],
    );
  }
}

class PageBubble extends StatelessWidget {

  final PageBubbleViewModel viewmodel;

  const PageBubble({Key key, this.viewmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
        width: ui.lerpDouble(20, 45, viewmodel.activePercent),
        height: ui.lerpDouble(20, 45, viewmodel.activePercent),
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: viewmodel.isHollow
                ? Colors.transparent
                : const Color(0x88FFFFFF),
            border: new Border.all(
                color: viewmodel.isHollow
                    ? const Color(0x88FFFFFF)
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
    );
  }
}
