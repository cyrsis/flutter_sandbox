import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class AnimatedIndicatorScreen extends StatefulWidget {
  @override
  _AnimatedIndicatorScreenState createState() =>
      new _AnimatedIndicatorScreenState();
}

class _AnimatedIndicatorScreenState extends State<AnimatedIndicatorScreen> {
  int fromTabIndex = 0;
  int toTabIndex = 0;
  Random random = new Random();

  void update() {
    setState(() {
      fromTabIndex = toTabIndex;
      toTabIndex = (random.nextInt(4) + fromTabIndex) % 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabIndicator(
        screenSize: MediaQuery.of(context).size,
        fromTabIndex: fromTabIndex,
        toTabIndex: toTabIndex,
      ),
        floatingActionButton: new FloatingActionButton(
          onPressed: update,
          tooltip: 'Change anmation',
          child: new Icon(Icons.add),
        )
    );
  }
}

class TabIndicator extends StatefulWidget {
  final Size screenSize;
  final int fromTabIndex;
  final int toTabIndex;

  TabIndicator({@required this.screenSize, this.fromTabIndex, this.toTabIndex});

  @override
  _TabIndicatorState createState() => new _TabIndicatorState();
}

class _TabIndicatorState extends State<TabIndicator>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> dxTargetAnim;
  Animation<double> dxEntryAnim;

  Size screenSize;

  double height;
  double section;
  double horizontalPadding;
  double iconSize;

  @override
  void initState() {
    super.initState();

    iconSize = 47.0;
    height = 70.0;
    screenSize = widget.screenSize;
    section = screenSize.width / 8;
    horizontalPadding = section - iconSize / 2;

    setupAnimation(widget.fromTabIndex, widget.toTabIndex);
  }

  @override
  void dispose() {
    if (animationController != null) animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(TabIndicator oldWidget) {

    super.didUpdateWidget(oldWidget);
        if(oldWidget.fromTabIndex != widget.fromTabIndex || oldWidget.toTabIndex != widget.toTabIndex)
          {
            setupAnimation(widget.fromTabIndex, widget.toTabIndex);
          }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: const Color(0xFFEE613A),
        child: new CustomPaint(
            size: new Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            painter: new _TabIndicatorPainter(
                dxTarget: dxTargetAnim.value,
                dxEntry: dxEntryAnim.value,
                dy: height / 2,
                radius: iconSize / 2),
            child: indicatorIcon()));
  }

  void setupAnimation(int fromTabIndex, int toTabIndex) {
    animationController = new AnimationController(
        duration: new Duration(milliseconds: 700), vsync: this);

    dxTargetAnim = new Tween<double>(
            begin: section * (fromTabIndex * 2 + 1),
            end: section * (toTabIndex * 2 + 1))
        .animate(intervalCurved(0.0, 1.0));

    dxEntryAnim = new Tween<double>(
            begin: section * (fromTabIndex * 2 + 1),
            end: section * (toTabIndex * 2 + 1))
        .animate(intervalCurved(0.5, 1.0));

    animationController
      ..addListener(() {
        setState(() {});
      });

    if (fromTabIndex != toTabIndex) {
      animationController.forward();
    }
  }

  CurvedAnimation intervalCurved(double begin, double end,
      [curve = Curves.easeOut]) {
    return new CurvedAnimation(
        parent: animationController,
        curve: new Interval(begin, end, curve: curve));
  }

  Widget indicatorIcon() {
    return new Container(
      width: screenSize.width,
      height: height,
      padding: new EdgeInsets.symmetric(vertical: height / 2 - iconSize / 2),
      child: new Stack(
        children: <Widget>[
          getIcon(0),
          getIcon(1),
          getIcon(2),
          getIcon(3),
        ],
      ),
    );
  }

  Widget getIcon(index) {
    return new Positioned(
        left: section * (index * 2 + 1) - iconSize / 2,
        child: new Container(
          width: 47.0,
          height: 47.0,
          alignment: Alignment.center,
          child: new Text('$index'),
        ));
  }
}

class _TabIndicatorPainter extends CustomPainter {
  Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  _TabIndicatorPainter(
      {this.dxTarget = 200.0,
      this.dxEntry = 50.0,
      this.radius = 25.0,
      this.dy = 25.0}) {
    painter = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    bool left2right = dxEntry < dxTarget;
    Offset entry = new Offset(left2right ? dxEntry : dxTarget, dy);
    Offset target = new Offset(left2right ? dxTarget : dxEntry, dy);

    Path path = new Path();
    path.addArc(
        new Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, 1 * pi);
    path.addRect(
        new Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(
        new Rect.fromCircle(center: target, radius: radius), 1.5 * pi, 1 * pi);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
