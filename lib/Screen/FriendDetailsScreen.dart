import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/FriendModel.dart';
import 'package:flutter_sandbox/Widgets/FriendDetailsBody.dart';
import 'package:flutter_sandbox/Widgets/FriendDetailsHeader.dart';
import 'package:flutter_sandbox/Widgets/FriendShowCase.dart';

import 'package:meta/meta.dart';

class FriendDetailsScreen extends StatefulWidget {
  FriendDetailsScreen(
      this.friend, {
        @required this.avatarTag,
      });

  final Friend friend;
  final Object avatarTag;

  @override
  _FriendDetailsScreenState createState() => new _FriendDetailsScreenState();
}

class _FriendDetailsScreenState extends State<FriendDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = new BoxDecoration(
      gradient: new LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: [
          const Color(0xFF413070),
          const Color(0xFF2B264A),
        ],
      ),
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new FriendDetailHeader(
                widget.friend,
                avatarTag: widget.avatarTag,
              ),
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child: new FriendDetailBody(widget.friend),
              ),
              new FriendShowcase(widget.friend),
            ],
          ),
        ),
      ),
    );
  }
}