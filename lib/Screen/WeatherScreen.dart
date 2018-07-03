import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppStyle.dart';
import 'package:flutter_sandbox/Widgets/Forecast.dart';
import 'package:flutter_sandbox/Widgets/ForecastAppBar.dart';
import 'package:flutter_sandbox/Widgets/SlidingDrawer.dart';
import 'package:flutter_sandbox/Widgets/Weather/WeekDrawer.dart';
import 'package:flutter_sandbox/Widgets/forecast_list.dart';
import 'package:flutter_sandbox/Widgets/radial_list.dart';
import 'package:meta/meta.dart';





class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => new _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> with TickerProviderStateMixin {

  OpenableController openableController;
  SlidingRadialListController slidingListController;
  String selectedDay = 'Monday, August 26';

  @override
  void initState() {
    super.initState();

    openableController = new OpenableController(
      vsync: this,
      openDuration: const Duration(milliseconds: 250),
    )
      ..addListener(() => setState(() {}));

    slidingListController = new SlidingRadialListController(
      itemCount: forecastRadialList.items.length,
      vsync: this,
    )
      ..open();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Forecast(
            radialList: forecastRadialList,
            slidingListController: slidingListController,
          ),

          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: new ForecastAppBar(
              onDrawerArrowTap: openableController.open,
              selectedDay: selectedDay,
            ),
          ),

          new SlidingDrawer(
            openableController: openableController,
            drawer: new WeekDrawer(
              onDaySelected: (String title) {
                setState(() {
                  selectedDay = title.replaceAll('\n', ', ');
                });

                slidingListController
                    .close()
                    .then((_) => slidingListController.open());

                openableController.close();
              },
            ),
          ),
        ],
      ),
    );
  }
}

