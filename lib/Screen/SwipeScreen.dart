//https://gist.githubusercontent.com/swat-cat/63797845dcd2bf6adc868c0daafd71f5/raw/491cd4b1be8b18d6ea8da89a2cd6a6eefd38f4df/slide.dart
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class SwipeScreen extends StatefulWidget {
  @override
  _SwipeScreenState createState() => new _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen>
    with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _showEasyController;
  Animation<Offset> _showEasy;
  bool _showHint;
  bool _isMenuAvailable;
  Animation<double> _frontScale;
  Animation<double> _backScale;

  AnimationController _controllerMenu;

  AnimationController _controllerText;

  AnimationController _opacityController;

  Animation<double> _animationMenu;

  @override
  void initState() {
    super.initState();
    _controllerMenu = new AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _controllerText = new AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _scaleController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    _showEasyController = new AnimationController(
        duration: const Duration(milliseconds: 20000), vsync: this);
    _opacityController = new AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);

    _animationMenu = new Tween(
      begin: 0.3,
      end: 1.0,
    )
        .animate(new CurvedAnimation(
      parent: _controllerMenu,
      curve: Curves.ease,
    ));

    _animationMenu.addListener((){
      setState(() {});
    });



    _showEasy =
        new Tween(begin: new Offset(0.0, 0.3), end: new Offset(0.0, 0.0))
            .animate(new CurvedAnimation(
      parent: _showEasyController,
      curve: new Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));

    _showEasy.addStatusListener((status) {
      if (status == AnimationStatus.completed) _scaleController.forward();
      if (status == AnimationStatus.dismissed) _scaleController.reverse();
      setState(() {
        _showHint = false;
        _isMenuAvailable = true;
      });
    });
    _frontScale = new Tween(
      begin: 1.0,
      end: 0.0,
    )
        .animate(new CurvedAnimation(
      parent: _scaleController,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    _backScale = new Tween(
      begin: 1.0,
      end: 0.0,
    )
        .animate(new CurvedAnimation(
      parent: _scaleController,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    _frontScale.addListener(() {
      setState(() {});
    });

    _backScale.addListener(() {
      setState(() {});
    });

    _backScale.addStatusListener((status) {
      if (status == AnimationStatus.completed) _showEasyController.reverse();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new SlideTransition(
              position: _showEasy,
              child: new Stack(
                children: <Widget>[
                  new Transform(
                    transform: new Matrix4.identity()
                      ..scale(1.0, _backScale.value, 1.0),
                    alignment: FractionalOffset.center,
                    child: new EasyCard(AppImage.portfolio2),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class EasyCard extends StatelessWidget {
  final String image;

  EasyCard(this.image);

  @override
  Widget build(BuildContext context) {
    return new Container(
      //Div
      alignment: FractionalOffset.center,
      height: 250.0,
      width: 250.0,
      decoration: new BoxDecoration(
          border: new Border.all(color: new Color(0xFF9E9E9E9))),
      child: image != null
          ? new Image.asset(image)
          : new Text("Animation in Flutter", style: AppStyle.MainTextStyle),
    );
  }
}
