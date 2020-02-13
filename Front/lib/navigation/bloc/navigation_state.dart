
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();
}

class AppNotInitialized extends NavigationState {
  @override
  List<Object> get props => [this];
}

class AppInitialized extends NavigationState {
  final dynamic contacts;
  AppInitialized({@required this.contacts});
  @override
  List<Object> get props => [this.contacts];
}

class MapShown extends NavigationState {
  @override
  List<Object> get props => [this];
}
