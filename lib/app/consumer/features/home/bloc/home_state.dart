part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final String? currentLocation;
  final String? interestedLocation;
  final LatLng currentLocationLat;
  final bool isSidebarOpen;

  HomeState({
    this.currentLocation,
    this.interestedLocation,
    LatLng? currentLocationLat,
    this.isSidebarOpen = false,
  }) : currentLocationLat =
           currentLocationLat ?? const LatLng(28.7041, 77.1025);
}

@immutable
abstract class HomeActionState extends HomeState {
  HomeActionState({
    super.currentLocation,
    super.interestedLocation,
    super.currentLocationLat,
    super.isSidebarOpen,
  });
}

class HomeInitial extends HomeState {
  HomeInitial() : super();
}

class HomeLocationUpdated extends HomeState {
  HomeLocationUpdated({
    required String? currentLocation,
    required String? interestedLocation,
    required LatLng currentLocationLat,
    required bool isSidebarOpen,
  }) : super(
         currentLocation: currentLocation,
         interestedLocation: interestedLocation,
         currentLocationLat: currentLocationLat,
         isSidebarOpen: isSidebarOpen,
       );
}

class HomeSidebarToggled extends HomeState {
  HomeSidebarToggled({
    required String? currentLocation,
    required String? interestedLocation,
    required LatLng currentLocationLat,
    required bool isSidebarOpen,
  }) : super(
         currentLocation: currentLocation,
         interestedLocation: interestedLocation,
         currentLocationLat: currentLocationLat,
         isSidebarOpen: isSidebarOpen,
       );
}

class HomeShowErrorActionState extends HomeActionState {
  final String error;

  HomeShowErrorActionState({
    required this.error,
    super.currentLocation,
    super.interestedLocation,
    super.currentLocationLat,
    super.isSidebarOpen,
  });
}

class HomeNavigateToCategoryActionState extends HomeActionState {
  final String currentLocation;
  final String interestedLocation;

  HomeNavigateToCategoryActionState({
    required this.currentLocation,
    required this.interestedLocation,
    super.currentLocationLat,
    super.isSidebarOpen,
  });
}
