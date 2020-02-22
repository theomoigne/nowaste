part of 'landingPage_bloc.dart';

abstract class LandingPageState {}

class LandingPageInitial extends LandingPageState {}

class DownloadAPKState extends LandingPageState {
  final success;

  DownloadAPKState(this.success);
}
