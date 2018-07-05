import 'package:flutter/material.dart';

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => new _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var _searchQuery = new TextEditingController();

  var isSearching =  false;




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: isSearching? _buildSearchBar() : _buildAppBar(),
      body: ,
    );
  }

  _buildSearchBar() {
    return new AppBar(
      leading: new BackButton(
        color: Theme.of(context).accentColor,
      ),
      title: new TextField(
        controller: _searchQuery,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search stocks',
        ),
      ),
      backgroundColor: Theme.of(context).canvasColor,
    );
  }

  _buildAppBar() {}
}
