//import 'package:flutter/material.dart';
//import 'package:fluttery/animations.dart';
//
//class AnimationPlayerExampleScreen extends StatefulWidget {
//  @override
//  _AnimationPlayerExampleState createState() => new _AnimationPlayerExampleState();
//}
//
//class _AnimationPlayerExampleState extends State<AnimationPlayerExampleScreen> {
//
//  double animationPercent = 0.0;
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: new Stack(
//          children: [
//            new Center(
//                child: new Text(
//                  '${animationPercent.toStringAsFixed(2)}',
//                  textAlign: TextAlign.center,
//                  style: new TextStyle(
//                    fontSize: 150.0,
//                    color: Colors.black,
//                  ),
//                )
//            ),
//            new Column(
//              children: [
//                new Padding(
//                  padding: const EdgeInsets.all(16.0),
//                  child: new Text(
//                    'Use the controls at the bottom of the screen to play each animation phase forward and backward at your desired speed.',
//                    textAlign: TextAlign.center,
//                    style: new TextStyle(
//                      fontSize: 18.0,
//                    ),
//                  ),
//                ),
//
//                new Expanded(child: new Container()),
//
//                new AnimationPlayer(
//                  playableAnimation: new PlayableAnimation(
//                    phases: [
//                      new Phase.uniform(
//                          uniformTransition: (newAnimationPercent) {
//                            setState(() => animationPercent = newAnimationPercent);
//                          }
//                      ),
//                      new Phase.bidirectional(
//                          forward: (forwardPercent) {
//                            setState(() => animationPercent = 1.0 + forwardPercent);
//                          },
//                          reverse: (reversePercent) {
//                            double uniformPercent = 1.0 - reversePercent;
//                            setState(() => animationPercent = 1.0 + uniformPercent);
//                          }
//                      ),
//                      new Phase.uniform(
//                        uniformTransition: (newAnimationPercent) {
//                          setState(() => animationPercent = 2.0 + newAnimationPercent);
//                        },
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            )
//          ],
//        ),
//
//    );
//  }
//}
