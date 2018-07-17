import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Screen/Animation/EasingAnimationScreen.dart';
import 'package:flutter_sandbox/Screen/Animation/MaskingAnimationScreen.dart';
import 'package:flutter_sandbox/Screen/Animation/OffSetDelayAnimationScreen.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';

class AnimationScreen extends StatefulWidget {
  AnimationScreen({Key key}) : super(key: key);

  @override
  _AnimationScreenState createState() => new _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("The 12 principle of Motions in UX",
            style: AppStyle.middWhiteText),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: new Icon(Icons.open_in_new),
            title: new Text('Easing'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => new EasingAnimationScreen()));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.photo),
            title: new Text('OffSet & Delay'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => new OffSetDelayAnimationScreen()));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.phone),
            title: new Text('Parenting'),
          ),
          ListTile(
            leading: Icon(Icons.transform),
            title: Text('TransForm'),
          ),
          ListTile(
            leading: Icon(Icons.track_changes),
            title: Text("Value Change"),
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text("Masking"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => new MaskingAnimationScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.layers),
            title: Text("OverLay"),
          ),
          ListTile(
            leading: Icon(Icons.cloud),
            title: Text("Cloning"),
          ),
          ListTile(
            leading: Icon(Icons.enhanced_encryption),
            title: Text("Obsecuration"),
          ),
          ListTile(
            leading: Icon(Icons.vertical_align_bottom),
            title: Text("Dimensionality"),
          ),
          ListTile(
            leading: Icon(Icons.zoom_in),
            title: Text("Dolly & Zoom"),
          ),
        ],
      ),
    );
  }
}
