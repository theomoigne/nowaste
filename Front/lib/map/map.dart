import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:nowaste/map/bloc/map_bloc.dart';
import 'package:nowaste/models/position.dart';


class Map extends StatelessWidget {
  static const String route = '/';
  final _mapBloc = MapBloc()..add(MapInitializationEvent());
  final position = new Position(51.5, -0.09);

  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[];
    return Scaffold(
      appBar: AppBar(title: Text('NoWaste - Accueil')),
      body: BlocBuilder<MapBloc, MapState>(
        bloc: _mapBloc,
        builder: (context, state) {
          if(state is MapDisplayState) {
            markers.clear();
            markers.addAll(
              _makeMarkers(state.interestPoints)
            );
          }

          return Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(position.getCoordinateSentence()),
              ),
              Row(
                children:[ 
                  ToggleButtons(
                    children: <Widget>[
                      Icon(Icons.info_outline)
                    ],
                    onPressed: (_) => _mapBloc..add(MapShowPointsEvent(!state.pointsAreVisible)), 
                    isSelected: [state.pointsAreVisible],
                ),]
              ),
              Flexible(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(position.lat, position.lng),
                    zoom: 5.0,
                    onLongPress: _handleLongPress
                  ),
                  layers: [
                    new TileLayerOptions(
                      urlTemplate: "https://api.tiles.mapbox.com/v4/"
                          "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                      additionalOptions: {
                        'accessToken': 'pk.eyJ1IjoiamFzbGllYiIsImEiOiJjazdoYmR4emswN3lqM2RvMmllazYycndwIn0.Qx1nAJgFvfA4uCb0-YlYLQ',
                        'id': 'mapbox.streets',
                      },
                    ),
                    MarkerLayerOptions(markers: markers)
                  ],
                ),
              ),
            ],
          ),
        );
        },
      )
    );
  }

  void _handleLongPress(LatLng point) {
    _mapBloc.add(MapAddPointEvent(point));
  }

  List<Marker> _makeMarkers(List<LatLng> points) =>
      points.map( (latlng) =>
        Marker(
          width: 32,
          height: 32,
          point: latlng,
          builder: (ctx) => Container(
            child: FlutterLogo(),
          ),
        )
      ).toList();
}
