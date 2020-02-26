abstract class NavigationState {
  const NavigationState();
}

class AppNotInitializedState extends NavigationState {}

class AppInitializedState extends NavigationState {}

class WebAppInitializedState extends NavigationState {}
