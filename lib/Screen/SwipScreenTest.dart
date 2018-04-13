// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';


class SwipeScreenTest extends StatefulWidget {
  @override
  _SwipeScreenTestState createState() => new _SwipeScreenTestState();
}

class _SwipeScreenTestState extends State<SwipeScreenTest>
    with TickerProviderStateMixin {
  AnimationController _controllerMenu;
  AnimationController _controllerText;
  AnimationController _scaleController;
  AnimationController _showEasyController;
  AnimationController _opacityController;
  Animation<double> _animationMenu;
  Animation<double> _animationText;
  Animation<double> _frontScale;
  Animation<double> _backScale;
  Animation<Offset> _showEasy;
  Animation<double> _swipeTextOpacity;
  bool _menuOpened = false;
  bool _showeasy = false;
  bool _openedOnce = false;
  bool _isMenuAvailable = true;


  @override
  void initState() {
    super.initState();
    _controllerMenu = new AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _controllerText = new AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _scaleController = new AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _showEasyController = new AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    _opacityController = new AnimationController(vsync: this,duration: const Duration(milliseconds: 800));
    _animationMenu = new Tween(begin: 0.3, end: 1.0).animate(
      new CurvedAnimation(
        parent: _controllerMenu,
        curve:Curves.ease,
      ),
    );
    _animationMenu.addListener((){
      setState((){});
    });
    _animationMenu.addStatusListener((status){
      if(status == AnimationStatus.completed ){
        _menuOpened = !_menuOpened;
        _controllerText.forward();
      }
      if(status == AnimationStatus.dismissed ){
        if (_showeasy) {
          _showEasyController.forward();
          setState(()=>_showeasy = false);
        }
        else{
          setState(()=>_openedOnce = false);
        }
      }
    });

    _animationText = new Tween(begin: -100.0, end: 16.0).animate(
      new CurvedAnimation(
        parent: _controllerText,
        curve:Curves.ease,
      ),
    );
    _animationText.addListener((){
      setState((){});
    });

    _animationText.addStatusListener((status){
      if(status == AnimationStatus.dismissed){
        _menuOpened = !_menuOpened;
        _controllerMenu.reverse();
      }

    });
    _showEasy = new Tween(
      begin: new Offset(0.0,3.0),
      end: new Offset(0.0,0.0),
    ).animate(new CurvedAnimation(
      parent: _showEasyController,
      curve: new Interval(0.0, 0.5, curve: Curves.easeInOut),
    ));
    _showEasy.addStatusListener((status){
      if(status == AnimationStatus.completed ){
        _scaleController.forward();
      }
      if(status == AnimationStatus.dismissed){
        _scaleController.reverse();
        setState((){
          _openedOnce = false;
          _isMenuAvailable = true;
        });
      }
    });

    _frontScale = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _scaleController,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));
    _backScale = new CurvedAnimation(
      parent: _scaleController,
      curve: new Interval(0.5, 1.0, curve: Curves.easeOut),
    );

    _frontScale.addListener((){
      setState((){});
    });
    _backScale.addListener((){
      setState((){});
    });

    _backScale.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _showEasyController.reverse();
      }
    });

    _swipeTextOpacity = new CurvedAnimation(parent: _opacityController, curve: Curves.easeInOut)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _opacityController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _opacityController.forward();
      }
    });
    _opacityController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerMenu.dispose();
    _controllerText.dispose();
    _opacityController.dispose();
    _scaleController.dispose();
    _showEasyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  new Container(
      color: Colors.white,
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            !_openedOnce?new FadeTransition(
              opacity: _swipeTextOpacity,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(Icons.arrow_back),
                  new Padding(padding: const EdgeInsets.only(left: 8.0)),
                  new Text("Swipe it",
                    style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.blueGrey
                    ),
                  )
                ],
              ),
            ):new Container(),
            new Align(
              child: new GestureDetector(
                child: new Container(
                  child: new ClipPath(
                    child: new Container(
                      color: Colors.blueAccent[200],
                      width: 250.0 * _animationMenu.value,
                    ),
                    clipper: new HillClipper(),
                  ),
                ),
                onHorizontalDragEnd: (details) {
                  if(!_isMenuAvailable) return;
                  if (details.velocity.pixelsPerSecond.dx > 0 && !_menuOpened) {
                    print("Open");
                    setState(()=>_openedOnce = true);
                    _controllerMenu.forward();
                  }
                  else if (details.velocity.pixelsPerSecond.dx < 0 && _menuOpened) {
                    print("Close");
                    _controllerText.reverse();
                  }
                },
              ),
              alignment: Alignment.centerLeft,
            ),
            new Align(
              child: new Transform(
                transform: new Matrix4.translationValues(
                    _animationText.value, 0.0, 0.0),
                child: new GestureDetector(
                  child: const Text("Tap Here",
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                  onTap: (){
                    _controllerText.reverse();
                    setState((){
                      _showeasy = true;
                      _isMenuAvailable = false;
                    });
                  },
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
            new SlideTransition(position: _showEasy,
                child: new Stack(
                  children: <Widget>[
                    new Transform(transform:  new Matrix4.identity()
                      ..scale(1.0, _backScale.value, 1.0),
                      alignment: FractionalOffset.center,
                      child: new EasyCard(AppImage.portfolio2),
                    ),
                    new Transform(transform:  new Matrix4.identity()
                      ..scale(1.0, _frontScale.value, 1.0),
                      alignment: FractionalOffset.center,
                      child: new EasyCard(null),
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }
}

class HillClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height/5);

    var medianControlPoint = new Offset(size.width, size.height/2);
    var medianPoint = new Offset(0.0, size.height - size.height/5);
    path.quadraticBezierTo(medianControlPoint.dx, medianControlPoint.dy,
        medianPoint.dx, medianPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class EasyCard extends StatelessWidget {
  final String image;

  EasyCard(this.image);

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: FractionalOffset.center,
      height: 250.0,
      width: 250.0,
      decoration: new BoxDecoration(
        border: new Border.all(color: new Color(0xFF9E9E9E)),
      ),
      child: image != null? new Image.asset(image): new Text(
        "Animations in flutter?",
        style: new TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
