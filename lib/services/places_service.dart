import 'package:http/http.dart' as http;
import 'package:provisions/models/place.dart';
import 'dart:convert' as convert;

import 'package:provisions/models/place_search.dart';


class PlacesService {
  final key = 'AIzaSyB60rEfnkN6QZNkD5GOUuTcLV4w-Qa5ZPM';

   Future<List<PlaceSearch>> getAutocomplete(String search) async {
     var url = Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key');
     http.Response response = await http.get(url);
     var json = convert.jsonDecode(response.body);
     var jsonResults = json['predictions'] as List;
     return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    var url = Uri.parse('https://maps.googleapis.com/maps/api/place/details/json?&key=$key&place_id=$placeId');
    http.Response response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }

  Future<List<Place>> getPlaces(double lat, double lng, String placeType) async {
    var url =
      Uri.parse('https://maps.googleapis.com/maps/api/place/textsearch/json?query=$placeType&location=$lat, $lng&rankby=distance&key=AIzaSyB60rEfnkN6QZNkD5GOUuTcLV4w-Qa5ZPM');
    http.Response response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }

}

//AIzaSyB60rEfnkN6QZNkD5GOUuTcLV4w-Qa5ZPM

//https://maps.googleapis.com/maps/api/place/textsearch/json?query=food banks&location=46.8188,-92.0843&key=AIzaSyB60rEfnkN6QZNkD5GOUuTcLV4w-Qa5ZPM