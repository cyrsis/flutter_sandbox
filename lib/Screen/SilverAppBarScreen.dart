import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/OrderItem.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';

class SilverAppBarScreen extends StatefulWidget {
  @override
  _SilverAppBarScreenState createState() => new _SilverAppBarScreenState();
}

class _SilverAppBarScreenState extends State<SilverAppBarScreen> {
  List<OrderItem> _items = <OrderItem>[
    new OrderItem(1, 'Mixed Grill', 'Platter', 1, 30.0, 'mixedgrill.jpg'),
    new OrderItem(
        2, 'Grill Chicken', 'Swandwich', 2, 10.0, 'chickswandwich.jpg'),
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
              (builder, index) => _buildListItem(_items[index]),
              childCount: _items.length,
            ),
            itemExtent: 172.0,
          ),
        ),
      ],
    );
  }

  _buildListItem(OrderItem item) {
    return new Card(
        child: new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Flexible(
          child: _buildColum1(item),
          flex: 1,
        ),
        new Flexible(
          child: _buildColum2(item),
          flex: 3,
        ),
      ],
    ));
  }

  _buildColum1(OrderItem item) {
    return new Column(children: <Widget>[
      new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new InkWell(
            child: new Hero(
          tag: item.id,
          child: new Image.asset('assets/${item.icon}',
              width: 100.0, height: 100.0, alignment: Alignment.center),
        )),
      ),
    ]);
  }

  _buildColum2(OrderItem item) {
    return null;
  }
}
