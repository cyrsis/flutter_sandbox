
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/ArtistMockData.dart';
import 'package:flutter_sandbox/Screen/ArtistDetailsScreen.dart';

class ArtistsDetailsAnimator extends StatefulWidget {
  @override
  _ArtistDetailsAnimator createState() => new _ArtistDetailsAnimator();
}

class _ArtistDetailsAnimator extends State<ArtistsDetailsAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new ArtistDetailsScreen(
      artist: ArtistMockData.andy,
      controller: _controller,
    );
  }
}