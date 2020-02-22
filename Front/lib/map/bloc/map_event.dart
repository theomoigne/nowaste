part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class MapInitializationEvent extends MapEvent {}

class MapShowPointsEvent extends MapEvent {
  final bool mustShowPoints;
  
  MapShowPointsEvent(this.mustShowPoints);
}

class MapAddPointEvent extends MapEvent {
  final LatLng point;

  MapAddPointEvent(this.point);
}
