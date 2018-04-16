import 'package:flutter/material.dart';

class ClockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new AspectRatio(
        aspectRatio: 1.0,
        child: new Stack(
          children: <Widget>[
            new Container(
              width: double.infinity,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[100],
                boxShadow: [
                  new BoxShadow(
                    offset: new Offset(0.0, 0.5),
                    blurRadius: 5.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
