import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Model/Profile.dart';
import 'package:flutter_sandbox/Widgets/MainMenu.dart';
import 'package:flutter_sandbox/Widgets/ProfileHeader.dart';
import 'package:flutter_sandbox/Widgets/QuickAction.dart';

class ProfileScreen extends StatelessWidget {
  final profile = getProfile();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          new ProfileHeader(profile),
          new QuickAction(),
          new ListMenu(),
        ],
      ),
    );
  }
}