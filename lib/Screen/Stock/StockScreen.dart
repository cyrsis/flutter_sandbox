import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/Stock/StockMenuItem.dart';
import 'package:flutter_sandbox/String/StockString.dart';

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => new _StockScreenState();
}

class _StockScreenState extends State<StockScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var _searchQuery = new TextEditingController();

  var isSearching = false;

  bool _isSearching = false;
  bool _autorefresh = false;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
          key: _scaffoldKey,
          appBar: isSearching ? _buildSearchBar() : _buildAppBar(),
          body: new TabBarView(
            children: <Widget>[
              _buildStockTab(context, StockHomeTab.market, widget.stocks.allSymbols),
              _buildStockTab(context, StockHomeTab.portfolio, portfolioSymbols),
            ],
          )),
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

  _buildAppBar() {
    return new AppBar(
      elevation: 0.0,
      title: new Text("Stock"),
      actions: <Widget>[
        new IconButton(
          icon: const Icon(Icons.search),
          onPressed: _handleSearchBegin,
          tooltip: 'Search',
        ),
        new PopupMenuButton<StockMenuItem>(
          onSelected: (StockMenuItem value) {
            _handleStockMenu(context, value);
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<StockMenuItem>>[
                new CheckedPopupMenuItem<StockMenuItem>(
                  value: StockMenuItem.autorefresh,
                  checked: _autorefresh,
                  child: Text('Autorefresh'),
                ),
                const PopupMenuItem<StockMenuItem>(
                  value: StockMenuItem.refresh,
                  child: Text('Refresh'),
                ),
                const PopupMenuItem<StockMenuItem>(
                  value: StockMenuItem.speedUp,
                  child: Text('Increase animation speed'),
                ),
                const PopupMenuItem<StockMenuItem>(
                  value: StockMenuItem.speedDown,
                  child: Text('Decrease animation speed'),
                ),
              ],
        ),
      ],
      bottom: new TabBar(
        tabs: <Widget>[
          new Tab(text: "market".toUpperCase()),
          new Tab(text: "profolio".toUpperCase()),
        ],
      ),
    );
  }

  void _handleSearchBegin() {
    setState(() {});
  }

  void _handleStockMenu(BuildContext context, StockMenuItem value) {}

  _buildStockTab(BuildContext context, market, allSymbols) {


  }
}
