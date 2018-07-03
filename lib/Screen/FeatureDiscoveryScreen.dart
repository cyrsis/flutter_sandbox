import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_sandbox/Widgets/FeatureDiscovery/FeatureDiscovery.dart';

final feature1 = "FEATURE_1";
final feature2 = "FEATURE_2";
final feature3 = "FEATURE_3";
final feature4 = "FEATURE_4";

class FeatureDiscoveryScreen extends StatefulWidget {
  @override
  _FeatureDiscoveryState createState() => new _FeatureDiscoveryState();
}

class _FeatureDiscoveryState extends State<FeatureDiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return new FeatureDiscovery(
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.green,
          leading: new DescribedFeatureOverlay(
            featureId: feature1,
            icon: Icons.menu,
            color: Colors.green,
            title: 'Just how you want it',
            description:
                'Tap the menu icon to switch accounts, change settings & more.',
            child: new IconButton(
              icon: new Icon(
                Icons.menu,
              ),
              onPressed: () {
                // TODO:
              },
            ),
          ),
          title: new Text(''),
          actions: <Widget>[
            new DescribedFeatureOverlay(
              featureId: feature2,
              icon: Icons.search,
              color: Colors.green,
              title: 'Search your compounds',
              description:
                  'Tap the magnifying glass to quickly scan your compounds.',
              child: new IconButton(
                icon: new Icon(
                  Icons.search,
                ),
                onPressed: () {
                  // TODO:
                },
              ),
            ),
          ],
        ),
        body: new Content(),
        floatingActionButton: new DescribedFeatureOverlay(
          featureId: feature3,
          icon: Icons.add,
          color: Colors.blue,
          title: 'FAB Feature',
          description: 'This is the FAB and it does stuff.',
          child: new FloatingActionButton(
            child: new Icon(
              Icons.add,
            ),
            onPressed: () {
              // TODO:
            },
          ),
        ),
      ),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => new _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Image.network(
              'https://www.balboaisland.com/wp-content/uploads/Starbucks-Balboa-Island-01.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
            ),
            new Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: Colors.blue,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: new Text(
                        'Starbucks Coffee',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    new Text(
                      'Coffee Shop',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                )),
            new Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: new RaisedButton(
                  child: new Text('Do Feature Discovery'),
                  onPressed: () {
                    FeatureDiscovery.discoverFeatures(
                        context, [feature1, feature2, feature3, feature4]);
                  },
                )),
          ],
        ),
        new Positioned(
            top: 200.0,
            right: 0.0,
            child: new FractionalTranslation(
              translation: const Offset(-0.5, -0.5),
              child: new DescribedFeatureOverlay(
                featureId: feature4,
                icon: Icons.drive_eta,
                color: Colors.blue,
                title: 'Find the fastest route',
                description:
                    'Get car, walking, cycling or public transit directions to this place.',
                child: new FloatingActionButton(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  child: new Icon(
                    Icons.drive_eta,
                  ),
                  onPressed: () {
                    // TODO:
                  },
                ),
              ),
            )),
      ],
    );
  }
}
