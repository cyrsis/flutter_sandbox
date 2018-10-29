import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

//Require geolocation
//Require flutter_map
class FluttermapScreen extends StatefulWidget {
  @override
  _FluttermapScreenState createState() => new _FluttermapScreenState();
}

class _FluttermapScreenState extends State<FluttermapScreen> {
  MapController controller = new MapController();

  getPermission() async {
    final GeolocationResult result =
    await Geolocation.requestLocationPermission(const LocationPermission(
        android: LocationPermissionAndroid.fine,
        ios: LocationPermissionIOS.always));
    return result;
  }

  getLocation() {
    return getPermission().then((result) async {
      if (result.isSuccessful) {
        final coords =
        await Geolocation.currentLocation(accuracy: LocationAccuracy.best);
        return coords;
      }
    });
  }

  buildMap() {
    getLocation().then((response) {
      response.listen((value) {
        if (value.isSuccessful) {
          controller.move(
              new LatLng(value.location.latitude, value.location.longitude),
              8.0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Geolocation'),
      ),
      body: new FlutterMap(
          mapController: controller,
          options: new MapOptions(center: buildMap(), minZoom: 5.0),
         // options: new MapOptions(center: new LatLng(40.71, -74.00), minZoom: 10.0),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),

            new MarkerLayerOptions(markers: [
              new Marker(
                  width: 45.0,
                  height: 45.0,
                  point: new LatLng(40.73, -74.00),
                  builder: (context) => new Container(
                    child: IconButton(
                      icon: Icon(Icons.location_on),
                      color: Colors.red,
                      iconSize: 45.0,
                      onPressed: () {
                        print('Marker tapped');
                      },
                    ),
                  ))
            ])

          ]),
    );
  }
}
