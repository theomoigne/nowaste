import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:nowaste/navigation/bloc/navigation.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {

  @override
  NavigationState get initialState => AppNotInitialized();

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is AppStarted) {
      try {
        yield AppNotInitialized();
        await Future.delayed(new Duration(seconds: 2));
        yield AppInitialized();
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  String toString() => "Navigtion bloc";
}
