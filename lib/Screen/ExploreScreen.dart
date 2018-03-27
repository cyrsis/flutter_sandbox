import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Widgets/WhiteCard.dart';
import 'package:carousel/carousel.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
          children: <Widget>[
            new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/explore/Background.png"),
                fit: BoxFit.cover,),
            ),
          ),
            new Carousel(
              children: [
                new NetworkImage(
                    'https://pbs.twimg.com/profile_images/760249570085314560/yCrkrbl3_400x400.jpg'),
                new NetworkImage(
                    'https://webinerds.com/app/uploads/2017/11/d49396_d9c5d967608d4bc1bcf09c9574eb67c9-mv2.png')
              ].map((netImage) => new Image(image: netImage)).toList(),
            ),

//          new Column(
//              children: [
//                new Image.asset('assets/explore/Title.png'),
//                new Padding(
//                  padding: const EdgeInsets.all(20.0),
//                  child: new Image.asset('assets/explore/TinderCard.png'),
//                ),
//
//                ]
//          )
          ]
      ),
    ); //End of Container
  }
}
