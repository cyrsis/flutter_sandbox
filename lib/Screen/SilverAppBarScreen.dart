import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/OrderItem.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';

class SilverAppBarScreen extends StatefulWidget {
  @override
  _SilverAppBarScreenState createState() => new _SilverAppBarScreenState();
}

class _SilverAppBarScreenState extends State<SilverAppBarScreen> {
  List<OrderItem> _items =<OrderItem>[
    new OrderItem(1, 'Mixed Grill', 'Platter', 1, 30.0, 'mixedgrill.jpg'),
    new OrderItem(2, 'Grill Chicken', 'Swandwich', 2, 10.0, 'chickswandwich.jpg'),
    new OrderItem(3, 'Fresh Orange Juice', 'Drink', 3, 8.0, 'orangejuice.jpg'),
    new OrderItem(4, 'Fresh Apple Juice', 'Drink', 1, 9.0, 'applejuice.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return new CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: <Widget>[
        new SliverAppBar(
          expandedHeight: 180.0,
          pinned: true,
          flexibleSpace: new FlexibleSpaceBar(
            title: new Text('Order Summary'),
            background: new Image.asset(
              AppImage.uncoverbackground,
              fit: BoxFit.cover,
            ),
          ),
        ),
        new SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
          sliver: new SliverFixedExtentList(
              delegate: new SliverChildBuilderDelegate(
                      (builder,index )=>
    _buildListItem(_items[index])),
              itemExtent: null),

        ),


      ],
    );
  }

  _buildListItem(OrderItem item) {

  }
}
