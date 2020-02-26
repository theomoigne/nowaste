part of 'landingPage_bloc.dart';

abstract class LandingPageEvent {}

class LoadingPageInitializationEvent extends LandingPageEvent {}

class DownloadAPKEvent extends LandingPageEvent {}
