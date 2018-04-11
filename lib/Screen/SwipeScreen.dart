import 'package:flutter/material.dart';

class SwipeScreen extends StatefulWidget {
  @override
  _SwipeScreenState createState() => new _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> with TickerProviderStateMixin {
  AnimationController _scaleController;

  AnimationController _showEasyController;

  Animation<Offset> _showEasy;

  bool _showHint;

  bool _isMenuAvailable;

  Animation<double> _frontScale;

  Animation<double> _backScale;

  @override
  void initState() {
    super.initState();
    _scaleController = new AnimationController(duration: const Duration(milliseconds:800 ) ,vsync: this);
    _showEasyController = new AnimationController(
        duration: const Duration(milliseconds: 20000), vsync: this);
    
    _showEasy = new Tween(begin: new Offset(0.0, 0.3),end: new Offset(0.0, 0.0))
                 .animate(
                 new CurvedAnimation(parent: _showEasyController, curve: new Interval(0.0, 0.5,curve: Curves.easeInOut), ));

    _showEasy.addStatusListener((status){
      if (status == AnimationStatus.completed)
        _scaleController.forward();
      if (status == AnimationStatus.dismissed)
        _scaleController.reverse();
      setState(() {
        _showHint= false;
        _isMenuAvailable =true;
      });
    });
    _frontScale = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _scaleController,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    _backScale = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _scaleController,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    


  }

  @override
  void dispose() {
    super.dispose();
    _scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}
