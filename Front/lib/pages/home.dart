import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import '../widgets/drawer.dart';

class Position {
  double lat;
  double lng;

  Position(this.lat, this.lng);

  String getCoordinateSentence() {
    return 'Vous êtes situé sur les coordoonées : (${lat}, ${lng}).';
  }
}

class HomePage extends StatelessWidget {
  static const String route = '/';
  var position = new Position(51.5, -0.09);

  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[

    ];

    return Scaffold(
      appBar: AppBar(title: Text('NoWaste - Accueil')),
      drawer: buildDrawer(context, route),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(position.getCoordinateSentence()),
            ),
            Flexible(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(position.lat, position.lng),
                  zoom: 5.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                    // For example purposes. It is recommended to use
                    // TileProvider with a caching and retry strategy, like
                    // NetworkTileProvider or CachedNetworkTileProvider
                    tileProvider: NetworkTileProvider(),
                  ),
                  MarkerLayerOptions(markers: markers)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
