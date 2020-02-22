import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:latlong/latlong.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  
  List<LatLng> interesPoints = List<LatLng>();
  bool pointsAreVisible = false;
  
  @override
  MapState get initialState => _makeMapState();
  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {

    if(event is MapShowPointsEvent) {
      pointsAreVisible = event.mustShowPoints;
    }

    if(event is MapAddPointEvent && pointsAreVisible) {
      interesPoints.add(event.point);
    }

    yield _makeMapState();
  }

  MapState _makeMapState() {
    var points = pointsAreVisible ? interesPoints : List<LatLng>();
    return MapDisplayState(points, pointsAreVisible);
  }

  void dispose() {}
}
