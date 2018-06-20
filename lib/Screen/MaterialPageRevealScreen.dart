import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Animation/AnimatedPageDragger.dart';
import 'package:flutter_sandbox/Models/MaterialPageModel.dart';
import 'package:flutter_sandbox/Models/PageIndicatorViewModel.dart';
import 'package:flutter_sandbox/Models/SlideDirection.dart';
import 'package:flutter_sandbox/Models/SlideUpdate.dart';
import 'package:flutter_sandbox/Models/TransitionGoal.dart';
import 'package:flutter_sandbox/Models/UpdateType.dart';
import 'package:flutter_sandbox/Repository/pages.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/MaterialPage.dart';
import 'package:flutter_sandbox/Widgets/PageDragger.dart';
import 'package:flutter_sandbox/Widgets/PageReveal.dart';
import 'package:flutter_sandbox/Widgets/Page_indicator.dart';

class MaterialPageRevealScreen extends StatefulWidget {
  @override
  _MaterialPageRevealScreenState createState() =>
      new _MaterialPageRevealScreenState();
}

class _MaterialPageRevealScreenState extends State<MaterialPageRevealScreen>
    with TickerProviderStateMixin {

  //init state
  AnimatedPageDragger animatedPageDragger;
  StreamController<SlideUpdate> slideUpdateStream;
  int activeIndex = 0;
  int nextPageIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;



  _MaterialPageRevealScreenState() {

    slideUpdateStream = new StreamController<SlideUpdate>()
      ..stream.listen((event) => setState(() {
            if (event.updateType == UpdateType.dragging) {
              slideDirection = event.direction;
              slidePercent = event.slidePercent;

              if (slideDirection == SlideDirection.lefToRight) {
                nextPageIndex = activeIndex - 1;
              } else if (slideDirection == SlideDirection.rightToLeft) {
                nextPageIndex = activeIndex + 1;
              } else {
                nextPageIndex = activeIndex;
              }
            } else if (event.updateType == UpdateType.doneDragging) {
              if (slidePercent > 0.5) {
                animatedPageDragger = new AnimatedPageDragger(
                  slideDirection: slideDirection,
                  transitionalGoal: TransitionGoal.open,
                  slidePercent: slidePercent,
                  slideUpdateStream: slideUpdateStream,
                  vsync: this,
                );
              } else {
                animatedPageDragger = new AnimatedPageDragger(
                  slideDirection: slideDirection,
                  transitionalGoal: TransitionGoal.close,
                  slidePercent: slidePercent,
                  slideUpdateStream: slideUpdateStream,
                  vsync: this,
                );

                nextPageIndex= activeIndex;
              }
              animatedPageDragger.run();

            } else if (event.updateType == UpdateType.animating) {
              slideDirection=event.direction;
              slidePercent=event.slidePercent;

              //Something happen
            } else if (event.updateType == UpdateType.doneAnimating) {

              activeIndex = nextPageIndex;

              slideDirection = SlideDirection.none;
              slidePercent = 0.0;

              animatedPageDragger.dispose();
            }
          }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(children: <Widget>[
        new MaterialPage(
          model: pages[activeIndex],
          percentVisible: 1.0,
        ),
        new PageReveal(
          revealpercent: slidePercent,
          child: new MaterialPage(
            model: pages[nextPageIndex], //Todo Change the number
            percentVisible: slidePercent,
          ),
        ),
        new Page_indicator(
          viewModel: new PageIndicatorViewModel(
              pages, activeIndex, slideDirection, slidePercent),
        ),
        new PageDragger(
            canDragLeftToRight: activeIndex > 0,
            canDragRightToLeft: activeIndex < pages.length - 1,
            slideUpdateStream: this.slideUpdateStream),
      ]),
    );
  }
}
