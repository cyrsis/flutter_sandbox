import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/MaterialPageModel.dart';
import 'package:flutter_sandbox/Models/PageBubbleViewModel.dart';
import 'package:flutter_sandbox/Models/PageIndicatorViewModel.dart';
import 'package:flutter_sandbox/Models/SlideDirection.dart';
import 'package:flutter_sandbox/Widgets/PageBubble.dart';

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
          viewModel.slideDirection == SlideDirection.rightToLeft) {
        percentActive = viewModel.slidepercent;
      } else {
        percentActive = 0.0;
      }

      var isHollow = i > viewModel.activeIndex ||
          (i == viewModel.activeIndex &&
              viewModel.slideDirection == SlideDirection.lefToRight);

      final pages = viewModel.pages[i];
      bubbles.add(new PageBubble(
        viewmodel: new PageBubbleViewModel(
            pages.iconAssetPath, pages.color, isHollow, percentActive),
      ));
    }


    //Translation of the  Indicator
    final BUBBLE_WITH = 55;
    final baseTranslation = (viewModel.pages.length * BUBBLE_WITH)/2- BUBBLE_WITH/2   ; //The container for each bubble is 55
    var translation = baseTranslation-viewModel.activeIndex* BUBBLE_WITH;
    if (viewModel.slideDirection==SlideDirection.lefToRight) {

      translation+= BUBBLE_WITH*viewModel.slidepercent;
      
    } else if (viewModel.slideDirection  == SlideDirection.rightToLeft) {
      translation-= BUBBLE_WITH*viewModel.slidepercent;
    }
    
    return new Column(
      children: <Widget>[
        new Expanded(child: new Container()),
        new Transform(
          transform: new Matrix4.translationValues(translation, 0.0, 0.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bubbles,
          ),
        )
      ],
    );
  }
}

