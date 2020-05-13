import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:latlong/latlong.dart';
import 'package:nowaste/httpClients/httpBaseClient.dart';
import 'package:nowaste/models/interestPoint.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  
  HttpBaseClient client = HttpBaseClient();
  List<LatLng> interestPoints = List<LatLng>();
  bool pointsAreVisible = false;
  
  @override
  MapState get initialState => _makeMapState();
  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {

    if(event is MapShowPointsEvent) {
      _getPoints();
      pointsAreVisible = event.mustShowPoints;
    }

    if(event is MapAddPointEvent && pointsAreVisible) {
      interestPoints.add(event.point);
    }

    yield _makeMapState();
  }

  MapState _makeMapState() {
    var points = pointsAreVisible ? interestPoints : List<LatLng>();
    return MapDisplayState(points, pointsAreVisible);
  }

  _getPoints() {
    var res = client.getRequest('points/');
    res.then((value) {
      var points = value.data;
      List<InterestPoint> posts = List.from(points).map((dynamic model)=> InterestPoint.fromJson(model)).toList();
      this.interestPoints =posts.map((e) => e.location).toList();
      this.add(MapMakeStateEvent());
    });
  }
}

