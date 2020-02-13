import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:nowaste/navigation/bloc/navigation.dart';
import 'package:nowaste/src/models/contact.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  var contacts = [
    new Contact('toto', false),
    new Contact('tata', false),
    new Contact('titi', false)
  ];

  @override
  NavigationState get initialState => AppNotInitialized();

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is AppStarted) {
      try {
        yield AppNotInitialized();
        await Future.delayed(new Duration(seconds: 3)); // Call to repo here>
        yield AppInitialized(contacts);
      } catch (e) {
        print(e);
      }
    } else if (event is SwitchFaourite) {
      final contact = event.contact;
      contacts = contacts
        .map(
          (e) =>
              e != contact ? 
                e :
                new Contact(contact.name, !contact.isFavourite)
        ).toList();
      yield AppInitialized(contacts);
    } else if (event is ShowFavourites) {
      final favourites = 
        contacts
        .where((e) => e.isFavourite)
        .toList();
      if (favourites.length > 0) {
        yield AppInitialized(favourites);
      }
    }
    // } else if (event is ShowMap) {
    //   yield MapShown();
    // else if(event is ShowInterestPoint) {
    //   yield Show();
    // }
  }
}
