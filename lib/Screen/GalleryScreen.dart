//Look into pageview, material widget,fractional offset
import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {

  final List<String> wallpaperimages = [
    "assets/wallpaper/wallpaper1.jpg",
    "assets/wallpaper/wallpaper2.jpg",
    "assets/wallpaper/wallpaper3.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return new Center(
      child:


       new SizedBox(
      width: 500.0,
      height: 500.0,
      child: PageView.builder(
          controller: PageController(viewportFraction: 1.0),
          itemCount: wallpaperimages.length,
          itemBuilder: (BuildContext context, int index) {
            return new Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 8.0),
              child: null,
            );
          }

      ),
    ),
    );
  }
}
