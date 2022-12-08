import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provisions/models/geometry.dart';
import 'package:provisions/models/location.dart';
import 'package:provisions/models/place.dart';

import 'package:provisions/models/place_search.dart';
import 'package:provisions/services/geolocator_service.dart';
import 'package:provisions/services/markers_service.dart';
import 'package:provisions/services/places_service.dart';

class ApplicationBloc with ChangeNotifier {

  final geoLocatorService = GeolocatorService();
  PlacesService placesService = PlacesService();
  final markerService = MarkerService();

  late Position currentLocation;
  late List<PlaceSearch> searchResults = [];
  StreamController<Place> selectedLocation = StreamController<Place>.broadcast();
  late Place selectedLocationStatic;
  String placeType = '';
  List<Marker> markers = <Marker>[];

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    selectedLocationStatic = Place(address: '', name: '',
        geometry: Geometry(location: Location(
            lat: currentLocation.latitude, lng: currentLocation.longitude)), vicinity: '');
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
   searchResults = await placesService.getAutocomplete(searchTerm);
   notifyListeners();
  }

  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    selectedLocation.add(await placesService.getPlace(placeId));
    searchResults = [];
    selectedLocationStatic = sLocation;
    notifyListeners();
  }

  togglePlaceType(String value, bool selected) async {
    if (selected){
      placeType = value;
    } else {
      placeType = '';
    }

    if (placeType != ''){

      var places = await placesService.getPlaces(selectedLocationStatic.geometry.location.lat, selectedLocationStatic.geometry.location.lng, placeType);
      markers = [];

      if (places.length > 0){

        for (var i = 0; i < places.length; i++) {
          var newMarker = markerService.createMarkerFromPlace(places[i]);
          markers.add(newMarker);
        }

      }
    }

    notifyListeners();
  }



  @override
  void dispose(){
    selectedLocation.close();
    super.dispose();
  }

}