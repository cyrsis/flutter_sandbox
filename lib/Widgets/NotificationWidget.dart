import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Screen/MapViewScreen.dart';

class NotificationWidget extends StatefulWidget {
  final String title;
  final String subtitle;

  const NotificationWidget({Key key, this.title, this.subtitle})
      : super(key: key);

  @override
  NotificationWidgetState createState() {
    return new NotificationWidgetState();
  }
}

class NotificationWidgetState extends State<NotificationWidget>
    with TickerProviderStateMixin {
  AnimationController _opacityAnimation;
  AnimationController _SlideupAnimation;


  Animation<double> nameOpacity;

  @override
  void initState() {
    super.initState();
    _opacityAnimation = new AnimationController(
        duration: new Duration(milliseconds: 1200), vsync: this)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});

    nameOpacity = new Tween(begin: 0.0, end: 1.0).animate(
      new CurvedAnimation(
        parent: _opacityAnimation,
        curve: new Interval(
          0.350,
          0.450,
          curve: Curves.easeIn,
        ),
      ),
    );



    _opacityAnimation.forward();
  }


  @override
  void dispose() {
    super.dispose();
    _opacityAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           new Transform(
             transform:new Matrix4.translationValues(0.0, 0.0, 0.0),
             child: ListTile(
              leading: const Icon(
                Icons.album,
                size: 40.0,
              ),
              title: const Text('Rainning Now'),
              subtitle: const Text('Umbella Available '),
          ),
           ),
          new ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: new Opacity(
                      opacity: nameOpacity.value,
                      child: new Text('2- Mins Walk')),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new MapViewScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
