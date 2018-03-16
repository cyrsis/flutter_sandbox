import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Fonts/ProfileFronts.dart';
import 'package:flutter_sandbox/Icons/Icons.dart';
import 'package:flutter_sandbox/Model/Profile.dart';
import 'package:flutter_sandbox/Widgets/Avatar.dart';
import 'package:flutter_sandbox/Widgets/VerticalDivider.dart';

class ProfileHeader extends StatelessWidget {

  final Profile profile;

  ProfileHeader(this.profile);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery
        .of(context)
        .padding
        .top;

    final headerGradient = new RadialGradient(
      center: Alignment.topLeft,
      radius: 0.4,
      colors: <Color>[
        const Color(0xFF8860EB),
        const Color(0xFF8881EB),
      ],
      stops: <double>[
        0.4, 1.0,
      ],
      tileMode: TileMode.repeated,
    );

    const headerHeight = 290.0;

    return new Container(
      height: headerHeight,
      decoration: new BoxDecoration(
        color: ProfileColors.primaryColor,
        boxShadow: <BoxShadow>[
          new BoxShadow(spreadRadius: 2.0,
              blurRadius: 4.0,
              offset: new Offset(0.0, 1.0),
              color: Colors.black38),
        ],
      ),
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // linear gradient
          new Container(
            height: headerHeight,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: <Color>[ //7928D1
                    const Color(0xFF7928D1), const Color(0xFF9A4DFF)],
                  stops: <double>[0.3, 0.5],
                  begin: Alignment.topRight, end: Alignment.bottomLeft
              ),
            ),
          ),
          // radial gradient
          new CustomPaint(
            painter: new HeaderGradientPainter(),
          ),
          new Padding(
            padding: new EdgeInsets.only(
                top: topPadding, left: 15.0, right: 15.0, bottom: 20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildBellIcon(),
                new Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: _buildTitle(),
                ),
                new Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: new Avator(profile),
                ),
                _buildFollowerStats()
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build the bell icon at the top right corner of the header
  Widget _buildBellIcon() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new IconButton(
            icon: new Icon(
              LineAwesomeIcons.bell, color: Colors.white, size: 30.0,),
            onPressed: () {}),
      ],
    );
  }

  Widget _buildTitle() {
    return new Text("Profile",
        style: new TextStyle(
            fontFamily: ProfileFontsName.TimeBurner,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 40.0,
            letterSpacing: 1.0));
  }

  Widget _buildFollowerStats() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildFollowerStat("Followers", profile.numberOfFollowersString),
        new VerticalDivider(),
        _buildFollowerStat("Following", profile.numberFollowingString),
        new VerticalDivider(),
        _buildFollowerStat("Total Likes", profile.totalLikesString),
      ],
    );
  }

  Widget _buildFollowerStat(String title, String value) {
    final titleStyle = new TextStyle(
        fontSize: 16.0,
        fontFamily: ProfileFontsName.TimeBurner,
        color: Colors.white);
    final valueStyle = new TextStyle(
        fontFamily: ProfileFontsName.TimeBurner,
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        color: Colors.white);
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(title, style: titleStyle),
        new Text(value, style: valueStyle),
      ],
    );
  }
}

class HeaderGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: paint background radial gradient
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}