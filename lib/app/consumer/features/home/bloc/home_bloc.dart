import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchCurrentLocationEvent>(_fetchCurrentLocation);
    on<UpdateCurrentLocationEvent>(_updateCurrentLocation);
    on<UpdateInterestedLocationEvent>(_updateInterestedLocation);
    on<ToggleSidebarEvent>(_toggleSidebar);
    on<NavigateToCategoryEvent>(_navigateToCategory);
  }

  FutureOr<void> _fetchCurrentLocation(
    FetchCurrentLocationEvent event,
    Emitter<HomeState> emit,
  ) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(
        HomeShowErrorActionState(
          error: "Location services are OFF! Please enable GPS.",
          currentLocation: state.currentLocation,
          interestedLocation: state.interestedLocation,
          currentLocationLat: state.currentLocationLat,
          isSidebarOpen: state.isSidebarOpen,
        ),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        emit(
          HomeShowErrorActionState(
            error:
                "Location permissions are permanently denied. Enable from settings.",
            currentLocation: state.currentLocation,
            interestedLocation: state.interestedLocation,
            currentLocationLat: state.currentLocationLat,
            isSidebarOpen: state.isSidebarOpen,
          ),
        );
        return;
      }
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      String? locationName = await _getPlaceName(
        position.latitude,
        position.longitude,
      );
      emit(
        HomeLocationUpdated(
          currentLocation: locationName,
          interestedLocation: state.interestedLocation,
          currentLocationLat: LatLng(position.latitude, position.longitude),
          isSidebarOpen: state.isSidebarOpen,
        ),
      );
    }
  }

  FutureOr<void> _updateCurrentLocation(
    UpdateCurrentLocationEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      HomeLocationUpdated(
        currentLocation: event.location,
        interestedLocation: state.interestedLocation,
        currentLocationLat: state.currentLocationLat,
        isSidebarOpen: state.isSidebarOpen,
      ),
    );
  }

  FutureOr<void> _updateInterestedLocation(
    UpdateInterestedLocationEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      HomeLocationUpdated(
        currentLocation: state.currentLocation,
        interestedLocation: event.location,
        currentLocationLat: state.currentLocationLat,
        isSidebarOpen: state.isSidebarOpen,
      ),
    );
  }

  FutureOr<void> _toggleSidebar(
    ToggleSidebarEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      HomeSidebarToggled(
        currentLocation: state.currentLocation,
        interestedLocation: state.interestedLocation,
        currentLocationLat: state.currentLocationLat,
        isSidebarOpen: !state.isSidebarOpen,
      ),
    );
  }

  FutureOr<void> _navigateToCategory(
    NavigateToCategoryEvent event,
    Emitter<HomeState> emit,
  ) {
    if (event.currentLocation.isEmpty || event.interestedLocation.isEmpty) {
      emit(
        HomeShowErrorActionState(
          error: "Please select both locations before proceeding.",
          currentLocation: state.currentLocation,
          interestedLocation: state.interestedLocation,
          currentLocationLat: state.currentLocationLat,
          isSidebarOpen: state.isSidebarOpen,
        ),
      );
    } else {
      emit(
        HomeNavigateToCategoryActionState(
          currentLocation: event.currentLocation,
          interestedLocation: event.interestedLocation,
          currentLocationLat: state.currentLocationLat,
          isSidebarOpen: state.isSidebarOpen,
        ),
      );
    }
  }

  Future<String?> _getPlaceName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        return "${place.locality}, ${place.administrativeArea}, ${place.country}";
      }
      return "Unknown Location";
    } catch (e) {
      return "Error Fetching Address";
    }
  }
}
