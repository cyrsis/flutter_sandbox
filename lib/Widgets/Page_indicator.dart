import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/MaterialPageModel.dart';

enum SlideDirection {
  lefToRight,
  RightToLeft,
}

class Page_indicatorViewModel {
  final List<MaterialPageModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidepercent;
}

class Page_BubbleViewModel {
  final String iconAsset;
  final Color color;
  final bool isHollow;
  final double activePercent;

  Page_BubbleViewModel(this.iconAsset, this.color, this.isHollow, this.activePercent);



}

class Page_indicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Expanded(child: new Container()),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                width: 20.0,
                height: 20.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle, color: const Color(0x88FFFFFF)),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                width: 50.0,
                height: 50.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle, color: const Color(0x88FFFFFF)),
                child: new Image.asset(
                  'assets/materialpage/wallet.png',
                  color: Colors.blue,
                ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                width: 15.0,
                height: 15.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: const Color(0x88FFFFFF),
                      width: 3.0,
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }
}
