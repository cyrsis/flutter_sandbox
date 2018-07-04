import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/CartBloc/Catalog.dart';
import 'package:flutter_sandbox/Screen/CartBloc/BlocCartPage.dart';
import 'package:flutter_sandbox/Screen/CartBloc/CartBloc.dart';
import 'package:flutter_sandbox/Screen/CartBloc/CartProvider.dart';
import 'package:flutter_sandbox/Styles/AppTheme.dart';
import 'package:flutter_sandbox/Widgets/CartBloc/CartButton.dart';
import 'package:flutter_sandbox/Widgets/CartBloc/ProductSquare.dart';


class CartBloCScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: MaterialApp(
        title: 'Bloc',
        theme: AppTheme.CartBloc,
        home: MyHomePage(),
        routes: <String, WidgetBuilder>{
          BlocCartPage.routeName: (context) => BlocCartPage()
        },
      ),
    );
  }
}

/// The sample app's main page
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
        actions: <Widget>[
          new StreamBuilder(
            stream: cartBloc.itemCount,
            initialData: 0,
            builder: (context, snapshot) =>
                new CartButton(
                  itemCount: snapshot.data,
                  onPressed: () {
                    Navigator.of(context).pushNamed(BlocCartPage.routeName);
                  },
                ),
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}

/// Displays a tappable grid of products
class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = CartProvider.of(context);
    return GridView.count(
      crossAxisCount: 2,
      children: catalog.products.map((product) {
        return ProductSquare(
          product: product,
          onTap: () {
            cartBloc.cartAddition.add(CartAddition(product));
          },
        );
      }).toList(),
    );
  }
}
