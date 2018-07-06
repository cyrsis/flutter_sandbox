import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/BeerModel.dart';
import 'package:flutter_sandbox/Screen/BeerHeroAnimationScreen/BeerTitle.dart';
import 'package:flutter_sandbox/Screen/BeerHeroAnimationScreen/BeersDetails.dart';


class BeerHeroAnimationScreen extends StatefulWidget {
  BeerHeroAnimationScreen({Key key}) : super(key: key);

  @override
  _BeerHeroAnimationScreenState createState() => new _BeerHeroAnimationScreenState();
}

class _BeerHeroAnimationScreenState extends State<BeerHeroAnimationScreen> with TickerProviderStateMixin {
  Map<int, AnimationController> controllerMaps = new Map();
  Map<int, CurvedAnimation> animationMaps = new Map();

  @override
  void initState() {
    beers.forEach((Beer beer){
      AnimationController _controller = AnimationController(duration: Duration(milliseconds: 400), vsync: this,);
      CurvedAnimation _animation = new CurvedAnimation(parent: _controller, curve: Curves.easeIn);

      controllerMaps[beer.id] = _controller;
      _controller.addStatusListener((AnimationStatus status){
        if(status == AnimationStatus.completed){
          _handleHero(beer);
        }
      });
      animationMaps[beer.id] = _animation;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.grey.shade200,
      ),
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('Beer', style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey.shade500
          ),),
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemBuilder: (context, index){
            Beer beer = beers[index];
            AnimationController _controller = controllerMaps[beer.id];
            CurvedAnimation _animation = animationMaps[beer.id];
            return BeerTile(
              beer: beer,
              isHeader: false,
              animation: _animation,
              onAction: (){
                _controller.forward();
              },
            );
          },
          itemCount: beers.length,
        ),
      ),
    );
  }

  void _handleHero(Beer beer) {
    AnimationController _controller = controllerMaps[beer.id];
    CurvedAnimation _animation = animationMaps[beer.id];
    Navigator.push(context,
        MaterialPageRoute(builder: (context){
          return BeerDetail(
            beer: beer,
            animation: _animation,
            onAction: (){
              Navigator.pop(context);
            },
          );
        }, fullscreenDialog: true)
    ).then((value){
      Future.delayed(Duration(milliseconds: 600)).then((v){
        _controller.reverse();
      });
    });
  }
}