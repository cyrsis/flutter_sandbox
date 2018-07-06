import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/BeerModel.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class BeerHeroAnimationScreen extends StatefulWidget {
  BeerHeroAnimationScreen({Key key}) : super(key: key);

  @override
  _BeerHeroAnimationScreenState createState() =>
      new _BeerHeroAnimationScreenState();
}

class _BeerHeroAnimationScreenState extends State<BeerHeroAnimationScreen> with TickerProviderStateMixin {
  var controllerMaps;





  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(elevation: 0.0,title: new Text("Beer", style: AppStyle.hiddendrawerTitle),centerTitle: true,),
      body: new ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: artist.videos.length,
        itemBuilder: (BuildContext context, int index) {
          var video = artist.videos[index];
          return new VideoCard(video);
        },
      ),,
    );
  }

  @override
  void initState() {

    beers.forEach((beer) {
     var  _animationController = new AnimationController(
          duration: const Duration(milliseconds: 400), vsync: this);
     
     var _Curveanimation = new CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

     controllerMaps[beer.id] =_animationController;



    });

        super.initState();
  }

  @override
  void dispose() {

  }


}
