import 'package:provisions/models/geometry.dart';

class Place {
  final Geometry geometry;
  final String address;
  final String vicinity;
  final String name;

  Place({required this.geometry, required this.address, required this.vicinity, required this.name});

  factory Place.fromJson(Map<String, dynamic> parsedJson){
    return Place(
      geometry: Geometry.fromJson(parsedJson['geometry']),
      address: parsedJson['formatted_address'],
      vicinity: parsedJson['vicinity'],
      name: parsedJson['name'],
    );
  }
}