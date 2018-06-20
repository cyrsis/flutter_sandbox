import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/SlideDirection.dart';
import 'package:flutter_sandbox/Models/SlideUpdate.dart';
import 'package:flutter_sandbox/Models/TransitionGoal.dart';
import 'package:flutter_sandbox/Models/UpdateType.dart';

class AnimatedPageDragger {
  static const PERCENT_PER_MILLISECOND = 0.010;

  final SlideDirection slideDirection;
  final TransitionGoal transitionalGoal;

  AnimationController completeAnimationController;

  double slidePercent;

  AnimatedPageDragger(
      {this.slideDirection,
      this.transitionalGoal,
      this.slidePercent,
      StreamController<SlideUpdate> slideUpdateStream,
      TickerProvider vsync}) {
    final startSlidePercent = slidePercent;
    var endSlidePrecent;
    var duration;

    if (transitionalGoal == TransitionGoal.open) {
      endSlidePrecent = 1.0;
      final slideRemaining = 1.0 - slidePercent;
      duration = new Duration(
          milliseconds: (slideRemaining / PERCENT_PER_MILLISECOND).round());
    } else {
      endSlidePrecent = 0.0;
      duration = new Duration(
          milliseconds: (slidePercent / PERCENT_PER_MILLISECOND).round());
    }

    completeAnimationController =
        new AnimationController(duration: duration, vsync: vsync)
          ..addListener(() {
            slidePercent = lerpDouble(startSlidePercent, endSlidePrecent,
                completeAnimationController.value);

            slideUpdateStream.add(new SlideUpdate(
                UpdateType.animating, slideDirection, slidePercent));
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              slideUpdateStream.add(new SlideUpdate(
                  UpdateType.doneAnimating, slideDirection, endSlidePrecent));
            }
          });


  }
  run() {
    print("---Animated Dragger Run!!");
    completeAnimationController.forward(from: 0.0);
  }

  dispose() {
    completeAnimationController.dispose();
  }
}
