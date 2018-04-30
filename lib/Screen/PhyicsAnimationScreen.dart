import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'dart:math';

class PhyicsAnimationScreen extends StatefulWidget {
  final boxPosition;

  PhyicsAnimationScreen({this.boxPosition = 0.0});

  @override
  _PhyicsAnimationScreenState createState() =>
      new _PhyicsAnimationScreenState();
}

class _PhyicsAnimationScreenState extends State<PhyicsAnimationScreen>
    with TickerProviderStateMixin {
  double boxPosition;
  double boxPositionOnStart;
  Offset start;
  Offset point;
  AnimationController _animationController;
  ScrollSpringSimulation simulation;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanStart: startDrag,
      onPanUpdate: onDrag,
      onPanEnd: endDreag,
      child: new CustomPaint(
        painter: new BoxPainter(),
        child: new Container(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    boxPosition = widget.boxPosition; //use boxPosition as propertity

    simulation = new ScrollSpringSimulation(
        new SpringDescription(mass: 1.0, stiffness: 1.0, damping: 1.0),
        0.0, //Start
        1.0, //End
        0.0 //Velocity
        );

    _animationController = new AnimationController(vsync: this)
      ..addListener(() {
        print("${simulation.x(_animationController.value)}");
      });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void startDrag(DragStartDetails details) {
    start = (context.findRenderObject() as RenderBox)
        .globalToLocal(details.globalPosition);
    boxPositionOnStart = boxPosition;
  }

  void onDrag(DragUpdateDetails details) {
    setState(() {
      point = (context.findRenderObject() as RenderBox)
          .globalToLocal(details.globalPosition);
      final dragVec = start.dy - point.dy;
      final normDragVec = (dragVec / context.size.height).clamp(-1.0, 1.0);
      boxPosition = (boxPositionOnStart + normDragVec).clamp(0.0, 1.0);
    });
  }

  void endDreag(DragEndDetails details) {
    setState(() {
      start = null;
      point = null;
      boxPositionOnStart = null;
    });
  }
}

class BoxPainter extends CustomPainter {
  double boxPositon;
  double boxPositionOnStart;
  Color color;
  Offset touchPoint;
  Paint boxPaint;
  Paint droppaint;

  BoxPainter(
      {this.boxPositon = 0.0,
      this.boxPositionOnStart = 0.0,
      this.touchPoint,
      }): boxPaint = new Paint(),
          droppaint = new Paint(){
     boxPaint.color= this.color;
     boxPaint.style = PaintingStyle.fill;
     droppaint.color = Colors.grey;
     droppaint.style= PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    final boxValueY  = size.height-(size.height*boxPositon);
    final prevBoxValuesY = size.height-(size.height*boxPositon)
    final midPointY = ((boxValueY-prevBoxValuesY))
    

    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
  }
}
