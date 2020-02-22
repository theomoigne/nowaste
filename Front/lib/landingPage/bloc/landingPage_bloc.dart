import 'dart:async';

import 'package:bloc/bloc.dart';
part 'landingPage_event.dart';
part 'landingPage_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  @override
  LandingPageState get initialState => LandingPageInitial();

  @override
  Stream<LandingPageState> mapEventToState(
    LandingPageEvent event,
  ) async* {
    if(event is DownloadAPKEvent) {
      // call repo here
      yield DownloadAPKState(true);
    }
  }
}
