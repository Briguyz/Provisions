import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:provisions/maps.dart';
import 'package:provisions/services/geolocator_service.dart';

//import 'package:provisions/maps.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeolocatorService();

  late Position currentLocation;

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }


}