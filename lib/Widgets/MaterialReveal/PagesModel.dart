import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';

final pages = [
  new MaterialPageViewModel(
      const Color(0xFF678FB4),
      AppImage.materialhotels,
      'Hotels',
      'All hotels and hostels are sorted by hospitality rating',
      AppImage.materialKey
  ),
  new MaterialPageViewModel(
      const Color(0xFF65B0B4),
      AppImage.materialbanks,
      'Banks',
      'We carefully verify all banks before adding them into the app',
      AppImage.materialWallet
  ),
  new MaterialPageViewModel(
    const Color(0xFF9B90BC),
    AppImage.materialStores,
    'Store',
    'All local stores are categorized for your convenience',
    AppImage.materialShoppingCart,
  ),
];

class MaterialPages extends StatelessWidget {

  final MaterialPageViewModel viewModel;
  final double percentVisible;

  MaterialPages({
    this.viewModel,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: double.INFINITY,
        color: viewModel.color,
        child: new Opacity(
          opacity: percentVisible,
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Transform(
                  transform: new Matrix4.translationValues(0.0, 50.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(bottom: 25.0),
                    child: new Image.asset(
                        viewModel.heroAssetPath,
                        width: 200.0,
                        height: 200.0
                    ),
                  ),
                ),
                new Transform(
                  transform: new Matrix4.translationValues(0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: new Text(
                      viewModel.title,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'FlamanteRoma',
                        fontSize: 34.0,
                      ),
                    ),
                  ),
                ),
                new Transform(
                  transform: new Matrix4.translationValues(0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(bottom: 75.0),
                    child: new Text(
                      viewModel.body,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }
}

class MaterialPageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  MaterialPageViewModel(
    this.color,
    this.heroAssetPath,
    this.title,
    this.body,
    this.iconAssetPath,
  );
}