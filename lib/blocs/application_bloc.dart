import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provisions/models/place.dart';

import 'package:provisions/models/place_search.dart';
import 'package:provisions/services/geolocator_service.dart';
import 'package:provisions/services/places_service.dart';

class ApplicationBloc with ChangeNotifier {

  final geoLocatorService = GeolocatorService();
  PlacesService placesService = PlacesService();

  late Position currentLocation;
  late List<PlaceSearch> searchResults = [];
  StreamController<Place> selectedLocation = StreamController<Place>.broadcast();

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
   searchResults = await placesService.getAutocomplete(searchTerm);
   notifyListeners();
  }

  setSelectedLocation(String placeId) async {
    selectedLocation.add(await placesService.getPlace(placeId));
    searchResults = [];
    notifyListeners();
  }

  @override
  void dispose(){
    selectedLocation.close();
    super.dispose();
  }

}