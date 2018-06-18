import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/MaterialPageModel.dart';

enum SlideDirection {
  lefToRight,
  RightToLeft,
}

class PageIndicatorViewModel {
  final List<MaterialPageModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidepercent;

  PageIndicatorViewModel(
      {this.pages, this.activeIndex, this.slideDirection, this.slidepercent});
}

class PageBubbleViewModel {
  final String iconAsset;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(
      this.iconAsset, this.color, this.isHollow, this.activePercent);
}

class Page_indicator extends StatelessWidget {
  final PageIndicatorViewModel viewModel;

  const Page_indicator({Key key, this.viewModel}) : super(key: key);

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
            new PageBubble(
              viewmodel: new PageBubbleViewModel(
                  "assets/materialpage/shopping_cart.png",
                  Colors.green,
                  false,
                  1.0),
            ),
            new PageBubble(
              viewmodel: new PageBubbleViewModel(
                  "assets/materialpage/shopping_cart.png",
                  Colors.green,
                  false,
                  1.0),
            )
//            new PageBubble(
//              viewmodel: new PageBubbleViewModel(
//                  "assets/materialpage/shopping_cart.png",
//                  Colors.green,
//                  true,
//                  0.0),
//            ),
//            new Padding(
//              padding: const EdgeInsets.all(10.0),
//              child: new Container(
//                width: 15.0,
//                height: 15.0,
//                decoration: new BoxDecoration(
//                    shape: BoxShape.circle,
//                    border: new Border.all(
//                      color: const Color(0x88FFFFFF),
//                      width: 3.0,
//                    )),
//              ),
//            ),
          ],
        )
      ],
    );
  }
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel viewmodel;

  const PageBubble({Key key, this.viewmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
        width: 50.0,
        height: 50.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle, color: const Color(0x88FFFFFF)),
        child: new Image.asset(
          viewmodel.iconAsset,
          color: viewmodel.color,
        ),
      ),
    );
  }
}
