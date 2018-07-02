import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Models/RadialListItemViewModel.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Widgets/radial_list.dart';

final RadialListViewModel forecastRadialList = new RadialListViewModel(
  items: [
    new RadialListItemViewModel(
      icon: new AssetImage(AppImage.ic_rain),
      title: '11:30',
      subtitle: 'Light Rain',
      isSelected: true,
    ),
    new RadialListItemViewModel(
      icon: new AssetImage(AppImage.ic_rain),
      title: '12:30P',
      subtitle: 'Light Rain',
    ),
    new RadialListItemViewModel(
      icon: new AssetImage(AppImage.ic_cloudy),
      title: '1:30P',
      subtitle: 'Cloudy',
    ),
    new RadialListItemViewModel(
      icon: new AssetImage(AppImage.ic_sunny),
      title: '2:30P',
      subtitle: 'Sunny',
    ),
    new RadialListItemViewModel(
      icon: new AssetImage(AppImage.ic_sunny),
      title: '3:30P',
      subtitle: 'Sunny',
    ),
  ],
);