import 'package:nowaste/src/models/contact.dart';

abstract class NavigationState {
  const NavigationState();
}

class AppNotInitialized extends NavigationState {
}

class AppInitialized extends NavigationState {
  final List<Contact> contacts;

  AppInitialized(this.contacts);
}

class MapShown extends NavigationState {}
