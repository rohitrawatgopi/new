part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchCurrentLocationEvent extends HomeEvent {}

class UpdateCurrentLocationEvent extends HomeEvent {
  final String location;
  UpdateCurrentLocationEvent(this.location);
}

class UpdateInterestedLocationEvent extends HomeEvent {
  final String location;
  UpdateInterestedLocationEvent(this.location);
}

class ToggleSidebarEvent extends HomeEvent {}

class NavigateToCategoryEvent extends HomeEvent {
  final String currentLocation;
  final String interestedLocation;
  NavigateToCategoryEvent(this.currentLocation, this.interestedLocation);
}
