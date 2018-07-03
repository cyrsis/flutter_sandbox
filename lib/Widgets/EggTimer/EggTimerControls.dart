
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Widgets/EggTimer/EggTimer.dart';
import 'package:flutter_sandbox/Widgets/EggTimer/EggTimerButton.dart';

class EggTimerControls extends StatefulWidget {

  final eggTimerState;
  final Function() onPause;
  final Function() onResume;
  final Function() onRestart;
  final Function() onReset;

  EggTimerControls({
    this.eggTimerState,
    this.onPause,
    this.onResume,
    this.onRestart,
    this.onReset,
  });

  @override
  _EggTimerControlsState createState() => new _EggTimerControlsState();
}

class _EggTimerControlsState extends State<EggTimerControls> with TickerProviderStateMixin {

  AnimationController pauseResumeSlideController;
  AnimationController restartResetFadeController;

  @override
  void initState() {
    super.initState();

    pauseResumeSlideController = new AnimationController(
        duration: const Duration(milliseconds: 150),
        vsync: this
    )
      ..addListener(() => setState(() {}));
    pauseResumeSlideController.value = 1.0;

    restartResetFadeController = new AnimationController(
        duration: const Duration(milliseconds: 150),
        vsync: this
    )
      ..addListener(() => setState(() {}));
    restartResetFadeController.value = 1.0;
  }

  @override
  void dispose() {
    pauseResumeSlideController.dispose();
    restartResetFadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    switch (widget.eggTimerState) {
      case EggTimerState.ready:
        pauseResumeSlideController.forward();
        restartResetFadeController.forward();
        break;
      case EggTimerState.running:
        pauseResumeSlideController.reverse();
        restartResetFadeController.forward();
        break;
      case EggTimerState.paused:
        pauseResumeSlideController.reverse();
        restartResetFadeController.reverse();
        break;
    }

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new Opacity(
          opacity: 1.0 - restartResetFadeController.value,
          child: new Row(
            children: [
              new EggTimerButton(
                icon: Icons.refresh,
                text: 'RESTART',
                onPressed: widget.onRestart,
              ),
              new Expanded(child: new Container()),
              new EggTimerButton(
                icon: Icons.arrow_back,
                text: 'RESET',
                onPressed: widget.onReset,
              ),
            ],
          ),
        ),
        new Transform(
          transform: new Matrix4.translationValues(
              0.0,
              100 * pauseResumeSlideController.value,
              0.0
          ),
          child: new EggTimerButton(
            icon: widget.eggTimerState == EggTimerState.running
              ? Icons.pause
              : Icons.play_arrow,
            text: widget.eggTimerState == EggTimerState.running
              ? 'PAUSE'
              : 'RESUME',
            onPressed: widget.eggTimerState == EggTimerState.running
              ? widget.onPause
              : widget.onResume,
          ),
        ),
      ],
    );
  }
}
