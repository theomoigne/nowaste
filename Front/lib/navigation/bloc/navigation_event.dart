
import 'package:equatable/equatable.dart';
import 'package:nowaste/models/contact.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class AppStarted extends NavigationEvent {
  @override
  List<Object> get props => [this];
}

class SwitchFaourite extends NavigationEvent {
  final Contact contact;

  SwitchFaourite(this.contact);

  @override
  List<Object> get props => [contact];
}

class ShowMap extends NavigationEvent {
  @override
  List<Object> get props => [this];
}

class ShowInterestPoint extends NavigationEvent {
  // final Point point;
  @override
  List<Object> get props => [this]; //=> [point];
}

class ShowFavourites extends NavigationEvent {
  @override
  List<Object> get props => [this];

}
