import 'dart:async';

import 'package:bloc/bloc.dart';
import './navigation.dart';
import 'package:nowaste/src/models/contact.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState => AppNotInitialized();

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AppNotInitialized();
      await Future.delayed(new Duration(seconds: 1));
      yield AppInitialized(
        contacts: [
          new Contact('toto'),
          new Contact('tata'),
          new Contact('titi')
        ]
      );
    } else if (event is ShowMap) {
      yield MapShown();
    }
    // TODO
    // else if(event is ShowInterestPoint) {
    //   yield Show();
    // }
  }
}
