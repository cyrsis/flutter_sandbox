import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';

class ParallexScreen extends StatefulWidget {
  ParallexScreen({Key key}) : super(key: key);

  @override
  _ParallexScreenState createState() => new _ParallexScreenState();



  _cards(BuildContext context) {

   return new SliverGrid(
     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
       maxCrossAxisExtent: 200.0,
       mainAxisSpacing: 10.0,
       crossAxisSpacing: 10.0,
       childAspectRatio: 4.0,
     ),
     delegate: SliverChildBuilderDelegate(
           (BuildContext context, int index) {
         return Container(
           alignment: Alignment.center,
           color: Colors.teal[100 * (index % 9)],
           child: Text('grid item $index'),
         );
       },
       childCount: 20,
     ),
   );

  }
}

class _ParallexScreenState extends State<ParallexScreen> {
  double top= 0.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification)
            setState(() => top -= v.scrollDelta / 2);
        },
        child: new Stack(
          children: <Widget>[
            //The background
            new Positioned(
              top: top,
              child: new ConstrainedBox(
                constraints: new BoxConstraints(maxHeight: 300.0),
                child: new Image.asset(AppImage.colorblend_backgroundbg),
              ),
            ),
            //The scroll view
            new CustomScrollView(
              slivers: widget._cards(context),
            )
          ],
        ),
      ),
    );
    ;
  }
}
