import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'landingpage_event.dart';
part 'landingpage_state.dart';

class LandingpageBloc extends Bloc<LandingpageEvent, LandingpageState> {
  @override
  LandingpageState get initialState => LandingpageInitial();

  @override
  Stream<LandingpageState> mapEventToState(
    LandingpageEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
